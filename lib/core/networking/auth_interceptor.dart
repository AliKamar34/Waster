import 'dart:developer';

import 'package:dio/dio.dart';
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
    try {
      final token = await localDataSource.getToken();

      final isAuthEndpoint =
          options.path.contains('/Login') ||
          options.path.contains('/Register') ||
          options.path.contains('/RefreshToken');

      if (token != null && token.isNotEmpty && !isAuthEndpoint) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e, stackTrace) {
      log('AuthInterceptor onRequest error: $e');
      log(stackTrace.toString());
    }

    handler.next(options);
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

        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer ${newAuthModel.token}';

        final response = await dio.fetch(options);
        return handler.resolve(response);
      } catch (e, stackTrace) {
        await localDataSource.deleteTokens();
        log('AuthInterceptor onError (refresh failed): $e');
        log(stackTrace.toString());
        return handler.next(err);
      }
    }

    handler.next(err);
  }
}
