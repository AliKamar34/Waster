import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:waster/core/errors/dio_error_mapper.dart';
import 'package:waster/core/networking/api_end_points.dart';

class DioHelper {
  late final Dio _dio;
  DioHelper() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioException catch (e, stackTrace) {
      log('GET request failed: ${e.message}', error: e, stackTrace: stackTrace);
      throw Exception(mapDioError(e));
    }
  }

  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(endPoint, data: data, options: options);
      return response;
    } on DioException catch (e, stackTrace) {
      log(
        'POST request failed: ${e.message}',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(mapDioError(e));
    }
  }

  Future<Response> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(endPoint, data: data, options: options);
      return response;
    } on DioException catch (e, stackTrace) {
      log(
        'POST request failed: ${e.message}',
        error: e,
        stackTrace: stackTrace,
      );
      throw Exception(mapDioError(e));
    }
  }
}
