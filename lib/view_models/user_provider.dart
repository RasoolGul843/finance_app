import 'dart:convert';
import 'package:finance_app/repository/get_api_repository/get_api_repository.dart';
import 'package:finance_app/repository/post_api_repository/post_api_repository.dart';
import 'package:finance_app/repository/put_api_repository/put_api_repository.dart';
import 'package:finance_app/utils/constrents/api_urls/api_urls.dart';
import 'package:finance_app/utils/share_prefrences/shared_prefrence.dart';
import 'package:finance_app/view/app_screens/authentication_screens/login_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/home_screen.dart';
import 'package:finance_app/view/app_screens/profile_screens/profile_screen.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final PostApiRepository _postrepo = PostApiRepository();
  final PutApiRepository _putRepo = PutApiRepository();
  final GetApiRepository _getRepo = GetApiRepository();
  final GetSharedPrefService _sharedPrefService = GetSharedPrefService();

  bool _loading = false;
  bool get loading => _loading;

  String? _userName;
  String? _userImage;
  String? _userEmail;

  String? get userName => _userName;
  String? get userImage => _userImage;
  String? get userEmail => _userEmail;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  /// ✅ Set User Data
  void setUserData({String? name, String? image, String? email}) {
    _userName = name;
    _userImage = image;
    _userEmail = email;
    notifyListeners();
  }

  /// ✅ LOAD USER FROM LOCAL STORAGE (VERY IMPORTANT)
  Future<void> loadUserFromPrefs() async {
    final name = await _sharedPrefService.getUserName();
    final image = await _sharedPrefService.getUserImage();
    final email = await _sharedPrefService.getUserEmail();

    setUserData(name: name, image: image, email: email);
  }

  ///////// SIGNUP /////////
  Future<void> signUpFunction(
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    try {
      setLoading(true);

      final response = await _postrepo.postApiRepositoryFunction(
        data,
        "${Constants.baseUrl}${Constants.registerUrl}",
        context,
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['user'] != null) {
        String userId = res['user']['_id'] ?? '';
        String name = res['user']['name'] ?? '';
        String image = res['user']['image'] ?? '';
        String email = res['user']['email'] ?? '';

        await _sharedPrefService.saveAuthData(token: '', userId: userId);

        setUserData(name: name, image: image, email: email);

        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res['message'] ?? 'Signup failed')),
        );
      }
    } catch (e) {
      setLoading(false);
      print("SIGNUP ERROR: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signup failed: $e")));
    }
  }

  ///////// LOGIN /////////
  Future<void> loginFunction(
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    try {
      setLoading(true);

      final response = await _postrepo.postApiRepositoryFunction(
        data,
        "${Constants.baseUrl}${Constants.loginUrl}",
        context,
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['token'] != null) {
        String token = res['token'];
        String userId = res['user']['_id'] ?? '';
        String name = res['user']['name'] ?? '';
        String image = res['user']['image'] ?? '';
        String email = res['user']['email'] ?? '';

        /// ✅ SAVE DATA
        await _sharedPrefService.saveAuthData(token: token, userId: userId);

        await _sharedPrefService.saveUserData(
          name: name,
          image: image,
          email: email,
        );

        /// ✅ SET PROVIDER
        setUserData(name: name, image: image, email: email);

        /// ✅ NAVIGATE
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res['message'] ?? 'Login failed')),
        );
      }
    } catch (e) {
      setLoading(false);
      print("LOGIN ERROR: $e");
    }
  }

  /////////get profile /////////
  Future<void> getProfile(BuildContext context) async {
    try {
      final token = await GetSharedPrefService.getToken();

      final response = await _getRepo.getApiRepositoryFunction(
        url: "${Constants.baseUrl}${Constants.getProfileUrl}",
        token: token ?? '',
      );

      final user = response['user'];

      setUserData(
        name: user['name'],
        image: user['image'],
        email: user['email'],
      );
    } catch (e) {
      print("PROFILE ERROR: $e");
    }
  }

  ///////// UPDATE PROFILE /////////
  Future<void> updateProfileFunction(
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    try {
      setLoading(true);

      final token = await GetSharedPrefService.getToken();
      final userId = await _sharedPrefService.getUserId();

      final response = await _putRepo.authorizedPutApiRepositoryFunction(
        data,
        "${Constants.baseUrl}${Constants.updateProfileUrl}",
        token ?? '',
        context,
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['user'] != null) {
        String name = res['user']['name'] ?? _userName;
        String image = res['user']['image'] ?? _userImage;
        String email = res['user']['email'] ?? _userEmail;

        setUserData(name: name, image: image, email: email);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile updated successfully")),
        );
        print("UserId--------->: $userId");
        print("User Email-------->: $userEmail");
        print("User Image--------->: $userImage");
        print("User Name------->: $userName");
        Future.delayed(const Duration(milliseconds: 100), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          );
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(res['message'] ?? 'Update failed')),
        );
      }
    } catch (e) {
      setLoading(false);
      print("UPDATE PROFILE ERROR: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Update failed: $e")));
    }
  }
}
