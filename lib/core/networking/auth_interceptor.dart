import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:waster/core/errors/cache_exception.dart';
import 'package:waster/features/auth/data/datasource/auth_local_data_source.dart';
import 'package:waster/features/auth/data/datasource/auth_remote_date_source.dart';

class AuthInterceptor extends Interceptor {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDateSource remoteDataSource;
  final Dio dio;

  AuthInterceptor({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.dio,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_isAuthEndpoint(options.path)) {
      return handler.next(options);
    }

    try {
      final token = await localDataSource.getToken();

      if (token == null || token.isEmpty) {
        return handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.badResponse,
            error: 'No authentication token found',
            response: Response(
              requestOptions: options,
              statusCode: 401,
              statusMessage: 'Unauthorized - Missing token',
            ),
          ),
        );
      }

      options.headers['Authorization'] = 'Bearer $token';
      handler.next(options);
    } on CacheException catch (e) {
      log('Failed to retrieve auth token from cache: $e');

      handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.badResponse,
          error: 'Failed to retrieve authentication token',
          response: Response(
            requestOptions: options,
            statusCode: 401,
            statusMessage: 'Unauthorized - Token retrieval failed',
          ),
        ),
      );
    } catch (e, stackTrace) {
      log(
        'Unexpected error in AuthInterceptor.onRequest: $e',
        error: e,
        stackTrace: stackTrace,
      );

      handler.reject(
        DioException(
          requestOptions: options,
          error: 'Unexpected authentication error: $e',
          response: Response(
            requestOptions: options,
            statusCode: 500,
            statusMessage: 'Internal Server Error',
          ),
        ),
      );
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await localDataSource.getRefreshToken();
        if (refreshToken == null || refreshToken.isEmpty) {
          await localDataSource.deleteTokens();
          return handler.next(err);
        }

        final newAuthModel = await remoteDataSource.refreshToken(
          token: refreshToken,
        );

        await localDataSource.saveTokens(
          token: newAuthModel.token,
          refreshToken: newAuthModel.refreshToken,
        );
        final originalRequest = err.requestOptions;
        originalRequest.headers['Authorization'] =
            'Bearer ${newAuthModel.token}';
        final response = await dio.fetch(originalRequest);

        return handler.resolve(response);
      } catch (e, stackTrace) {
        await localDataSource.deleteTokens();
        log(
          'AuthInterceptor refresh token failed: $e',
          error: e,
          stackTrace: stackTrace,
        );
        return handler.next(err);
      }
    }
    handler.next(err);
  }

  bool _isAuthEndpoint(String path) {
    const authEndpoints = [
      '/Login',
      '/Register',
      '/RefreshToken',
      '/google-signin',
    ];

    return authEndpoints.any((endpoint) => path.contains(endpoint));
  }
}
