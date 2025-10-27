import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> saveToken(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> readToken(String key) async {
    return await storage.read(key: key);
  }

  Future<void> deleteToken(String key) async {
    await storage.delete(key: key);
  }
}
