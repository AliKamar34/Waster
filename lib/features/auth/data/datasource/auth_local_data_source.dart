import 'package:waster/core/errors/cache_exception.dart';
import 'package:waster/core/utils/secure_storage_helper.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens({
    required String token,
    required String refreshToken,
  });
  Future<String?> getToken();
  Future<String?> getRefreshToken();
  Future<void> deleteToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageHelper secureStorageHelper;
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'auth_refresh_token';
  AuthLocalDataSourceImpl({required this.secureStorageHelper});
  @override
  Future<void> deleteToken() async {
    try {
      await secureStorageHelper.deleteToken(_tokenKey);
    } catch (e) {
      throw const CacheException('Failed to delete token');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return await secureStorageHelper.readToken(_tokenKey);
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
      await secureStorageHelper.saveToken(_tokenKey, token);
      await secureStorageHelper.saveToken(_refreshTokenKey, refreshToken);
    } catch (e) {
      throw const CacheException('Failed to save token');
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      return await secureStorageHelper.readToken(_refreshTokenKey);
    } catch (e) {
      throw const CacheException('Failed to get refresh token');
    }
  }
}
