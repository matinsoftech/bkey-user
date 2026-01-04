import 'dart:convert';

import 'package:bkey_user/services/storage_services.dart';

class UserStorage {
  static const _userKey = 'user_data';
  static const _tokenKey = 'user_token';

  /// Save user data and token
  static Future<void> saveUser(Map<String, dynamic> user, String token) async {
    await StorageService.setString(_userKey, jsonEncode(user));
    await StorageService.setString(_tokenKey, token);
  }

  /// Get saved user data
  static Map<String, dynamic>? getUser() {
    final userJson = StorageService.getString(_userKey);
    if (userJson == null) return null;
    return jsonDecode(userJson);
  }

  /// Get saved token
  static String? getToken() {
    return StorageService.getString(_tokenKey);
  }

  /// Clear user data
  static Future<void> clear() async {
    await StorageService.remove(_userKey);
    await StorageService.remove(_tokenKey);
  }

  static bool isLoggedIn() {
    final token = getToken();
    return token != null && token.isNotEmpty;
  }

  static String? userName() {
    final user = getUser();
    return user != null ? user['name'] as String? : null;
  }

  static String? userEmail() {
    final user = getUser();
    return user != null ? user['email'] as String? : null;
  }
}



