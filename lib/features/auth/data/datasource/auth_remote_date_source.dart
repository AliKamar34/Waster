import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/core/networking/api_end_points.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/features/auth/data/models/auth_response_model.dart';

abstract class AuthRemoteDateSource {
  Future<AuthModel> login({required String email, required String password});
  Future<AuthModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String address,
    required String city,
    required String state,
  });
  Future<AuthModel> refreshToken({required String token});
  Future<void> revokeToken({required String token});
}

class AuthRemoteDateSourceImpl implements AuthRemoteDateSource {
  final DioHelper dioHelper;

  const AuthRemoteDateSourceImpl({required this.dioHelper});
  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.logIn,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException(
          message: 'Failed to login with $email and $password',
        );
      }
    } catch (e) {
      final cleanMessage = e.toString().replaceFirst('Exception: ', '');
      throw ServerException(message: cleanMessage);
    }
  }

  @override
  Future<AuthModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phoneNumber,
    required String address,
    required String city,
    required String state,
  }) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.register,
        data: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
          'phoneNumber': phoneNumber,
          'address': address,
          'city': city,
          'state': state,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw ServerException(
          message: 'Failed to login with $email and $password',
        );
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthModel> refreshToken({required String token}) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.refreshToken,
        data: {'refreshToken': token},
      );
      if (response.statusCode == 200) {
        return AuthModel.fromJson(response.data);
      } else {
        throw const ServerException(message: 'Failed to refresh token');
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> revokeToken({required String token}) async {
    try {
      final response = await dioHelper.postRequest(
        endPoint: ApiEndPoints.revokeToken,
        data: {'refreshToken': token},
      );
      if (response.statusCode != 200 || response.statusCode != 204) {
        return;
      }
      throw const ServerException(message: 'Failed to revoke token');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
