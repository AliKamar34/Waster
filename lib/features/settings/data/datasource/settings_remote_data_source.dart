import 'package:dio/dio.dart';
import 'package:waster/core/errors/server_exception.dart';
import 'package:waster/core/networking/api_end_points.dart';
import 'package:waster/core/networking/dio_helper.dart';
import 'package:waster/features/settings/data/models/user_model.dart';

abstract class SettingsRemoteDataSource {
  Future<UserModel> getUserDetails();
  Future<void> updateName({
    required String firstName,
    required String lastName,
  });
  Future<void> changeEmail({
    required String newEmail,
    required String password,
  });
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  });
  Future<void> updateLocation({required String address});
  Future<void> updatePhoneNumber({required String phoneNum});
  Future<void> updateBio({required String bio});
  Future<void> deleteAccount({required String password});
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final DioHelper dioHelper;

  const SettingsRemoteDataSourceImpl({required this.dioHelper});

  Future<void> _executeVoidRequest({
    required Future<Response> Function() request,
    required String errorMessage,
  }) async {
    try {
      final response = await request();

      if (response.statusCode == 200) return;

      throw ServerException(message: errorMessage);
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getUserDetails() async {
    try {
      final response = await dioHelper.getRequest(
        endPoint: ApiEndPoints.userDetails,
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }

      throw const ServerException(message: 'Failed to fetch user details');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> updateName({
    required String firstName,
    required String lastName,
  }) async {
    await _executeVoidRequest(
      request: () => dioHelper.putRequest(
        endPoint: ApiEndPoints.updateName,
        data: {'firstName': firstName, 'lastName': lastName},
      ),
      errorMessage: 'Failed to update name',
    );
  }

  @override
  Future<void> changeEmail({
    required String newEmail,
    required String password,
  }) async {
    await _executeVoidRequest(
      request: () => dioHelper.postRequest(
        endPoint: ApiEndPoints.changeEmail,
        data: {'newEmail': newEmail, 'password': password},
      ),
      errorMessage: 'Failed to change email',
    );
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    await _executeVoidRequest(
      request: () => dioHelper.postRequest(
        endPoint: ApiEndPoints.changePassword,
        data: {
          'currentPassword': currentPassword,
          'newPassword': newPassword,
          'confirmPassword': confirmPassword,
        },
      ),
      errorMessage: 'Failed to change password',
    );
  }

  @override
  Future<void> updateLocation({required String address}) async {
    await _executeVoidRequest(
      request: () => dioHelper.putRequest(
        endPoint: ApiEndPoints.updateLocation,
        data: {'address': address},
      ),
      errorMessage: 'Failed to update address',
    );
  }

  @override
  Future<void> updatePhoneNumber({required String phoneNum}) async {
    await _executeVoidRequest(
      request: () => dioHelper.putRequest(
        endPoint: ApiEndPoints.updatePhoneNumber,
        data: {'phoneNum': phoneNum},
      ),
      errorMessage: 'Failed to update phone number',
    );
  }

  @override
  Future<void> updateBio({required String bio}) async {
    await _executeVoidRequest(
      request: () => dioHelper.putRequest(
        endPoint: ApiEndPoints.updateBio,
        data: {'bio': bio},
      ),
      errorMessage: 'Failed to update bio',
    );
  }

  @override
  Future<void> deleteAccount({required String password}) async {
    await _executeVoidRequest(
      request: () => dioHelper.deteleRequest(
        endPoint: ApiEndPoints.deleteAccount,
        queryParameters: {'password': password},
      ),
      errorMessage: 'Failed to delete account',
    );
  }
}
