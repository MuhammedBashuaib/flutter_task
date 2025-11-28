import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_tasck_app/features/auth/data/models/user_model.dart';
import 'dart:convert';

class StorageService {
  static const _storage = FlutterSecureStorage();

  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';
  static const _keyUserData = 'user_data';
  static const _keyTokenExpiry = 'token_expiry';

  // ✅ دالة getAccessToken المطلوبة
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _keyAccessToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _keyRefreshToken);
  }

  Future<void> saveUser(UserModel user) async {
    await _storage.write(key: _keyAccessToken, value: user.accessToken);
    await _storage.write(key: _keyRefreshToken, value: user.refreshToken);
    await _storage.write(key: _keyUserData, value: json.encode(user.toJson()));

    // حفظ وقت انتهاء الصلاحية (افترض 30 دقيقة للـ access token)
    final expiryTime = DateTime.now()
        .add(Duration(minutes: 30))
        .toIso8601String();
    await _storage.write(key: _keyTokenExpiry, value: expiryTime);
  }

  Future<bool> hasValidToken() async {
    final token = await getAccessToken();
    final expiryString = await _storage.read(key: _keyTokenExpiry);

    if (token == null || expiryString == null) return false;

    try {
      final expiryTime = DateTime.parse(expiryString);
      return DateTime.now().isBefore(expiryTime);
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final userDataString = await _storage.read(key: _keyUserData);
    if (userDataString != null) {
      try {
        final userData = Map<String, dynamic>.from(json.decode(userDataString));
        return UserModel.fromJson(userData);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<void> clearAuthData() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyRefreshToken);
    await _storage.delete(key: _keyUserData);
    await _storage.delete(key: _keyTokenExpiry);
  }

  // ✅ دوال إضافية مفيدة
  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }

  Future<Map<String, String?>> getAllAuthData() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    final userData = await _storage.read(key: _keyUserData);

    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'userData': userData,
    };
  }
}
