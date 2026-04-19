import 'dart:convert';
import 'package:finance_app/repository/post_api_repository/post_api_repository.dart';
import 'package:finance_app/utils/constrents/api_urls/api_urls.dart';
import 'package:finance_app/utils/share_prefrences/shared_prefrence.dart';
import 'package:finance_app/view/app_screens/authentication_screens/login_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final PostApiRepository _repo = PostApiRepository();
  final GetSharedPrefService _sharedPrefService = GetSharedPrefService();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ///////// SIGNUP /////////
  Future<void> signUpFunction(
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    try {
      setLoading(true);

      final response = await _repo.postApiRepositoryFunction(
        data,
        "${Constants.baseUrl}${Constants.createUserUrl}",
        context,
      );

      setLoading(false);

      print("SIGNUP RESPONSE: $response");

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['user'] != null) {
        String userId = res['user']['_id'] ?? '';

        await _sharedPrefService.saveAuthData(token: '', userId: userId);

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

      final response = await _repo.postApiRepositoryFunction(
        data,
        "${Constants.baseUrl}${Constants.loginUrl}",
        context,
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      print("LOGIN RESPONSE: $res");

      if (res != null && res['token'] != null) {
        String token = res['token'];
        String userId = res['user']['_id'] ?? '';

        await _sharedPrefService.saveAuthData(token: token, userId: userId);

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
}
