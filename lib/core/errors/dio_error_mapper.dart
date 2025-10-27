import 'package:dio/dio.dart';

String mapDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return 'Connection timeout. Please try again.';
    case DioExceptionType.sendTimeout:
      return 'Send timeout. Please try again.';
    case DioExceptionType.receiveTimeout:
      return 'Receive timeout. Please try again.';
    case DioExceptionType.badResponse:
      return 'Received invalid status code: ${e.response?.statusCode}';
    case DioExceptionType.cancel:
      return 'Request was cancelled.';
    case DioExceptionType.connectionError:
      return 'Connection error. Check your internet connection.';
    default:
      return 'Unexpected error occurred.';
  }
}
