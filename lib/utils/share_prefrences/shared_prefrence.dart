import 'package:shared_preferences/shared_preferences.dart';

class GetSharedPrefService {
  /// SAVE TOKEN + USER ID
  Future<void> saveAuthData({
    required String token,
    required String userId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    await prefs.setString("userId", userId);
  }

  /// SAVE USER DATA
  Future<void> saveUserData({
    required String name,
    required String image,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    await prefs.setString("image", image);
    await prefs.setString("email", email);
  }

  /// GET TOKEN
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  /// GET USER ID
  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

  /// GET NAME
  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  /// GET IMAGE
  Future<String?> getUserImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("image");
  }

  /// GET EMAIL
  Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  /// LOGOUT
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

// class Constants {
//   static const String baseUrl =
//       "https://finance-app-backend-1-0s2r.onrender.com/api";

//   // USER
//   static const String createUserUrl = "/users/register";
//   static const String loginUrl = "/users/login";
//   static const String updateProfileUrl = "/users/update-profile";
//   static const String getProfileUrl = "/users/profile";

//   // CATEGORY
//   static const String createCategoryUrl = "/categories/create";
//   static const String getCategoriesUrl = "/categories";
//   static const String getCategoryByIdUrl = "/categories/";
//   static const String updateCategoryUrl = "/categories/";
//   static const String deleteCategoryUrl = "/categories/";
// }
