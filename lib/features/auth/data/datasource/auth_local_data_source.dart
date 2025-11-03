import 'package:waster/core/constants/app_constant.dart';
import 'package:waster/core/errors/cache_exception.dart';
import 'package:waster/core/utils/secure_storage_helper.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens({
    required String token,
    required String refreshToken,
  });
  Future<String?> getToken();
  Future<String?> getRefreshToken();
  Future<void> deleteTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageHelper secureStorageHelper;

  AuthLocalDataSourceImpl({required this.secureStorageHelper});
  @override
  Future<void> deleteTokens() async {
    try {
      await secureStorageHelper.deleteToken(AppConstant.tokenKey);
      await secureStorageHelper.deleteToken(AppConstant.refreshTokenKey);
    } catch (e) {
      throw const CacheException('Failed to delete token');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await secureStorageHelper.readToken(AppConstant.tokenKey);
    } catch (e) {
      throw const CacheException('Failed to get token');
    }
  }

  @override
  Future<void> saveTokens({
    required String token,
    required String refreshToken,
  }) async {
    try {
      await secureStorageHelper.saveToken(AppConstant.tokenKey, token);
      await secureStorageHelper.saveToken(
        AppConstant.refreshTokenKey,
        refreshToken,
      );
    } catch (e) {
      throw const CacheException('Failed to save token');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await secureStorageHelper.readToken(AppConstant.refreshTokenKey);
    } catch (e) {
      throw const CacheException('Failed to get refresh token');
    }
  }
}
