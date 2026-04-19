import 'package:shared_preferences/shared_preferences.dart';

class GetSharedPrefService {
  static const _tokenKey = 'auth_token';
  final _userIdKey = 'user_id';
  static const _isCompleteProfileKey = 'is_complete_profile';

  Future<void> saveAuthData({
    required String token,
    required String userId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userIdKey, userId);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<bool?> getIsCompleteProfile() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isCompleteProfileKey);
  }

  static Future<void> setProfileComplete(bool isComplete) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isCompleteProfileKey, isComplete);
  }

  static Future<void> clearAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);

    await prefs.remove(_isCompleteProfileKey);
  }

  static Future<bool> hasAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey) &&
        prefs.containsKey(_isCompleteProfileKey);
  }
}
