import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:finance_app/repository/get_api_repository/get_api_repository.dart';
import 'package:finance_app/repository/post_api_repository/post_api_repository.dart';
import 'package:finance_app/repository/put_api_repository/put_api_repository.dart';
import 'package:finance_app/utils/constrents/api_urls/api_urls.dart';

class CategoryProvider extends ChangeNotifier {
  final PostApiRepository _postRepo = PostApiRepository();
  final PutApiRepository _putRepo = PutApiRepository();
  final GetApiRepository _getRepo = GetApiRepository();

  bool _loading = false;
  bool get loading => _loading;

  List<dynamic> _categories = [];
  List<dynamic> get categories => _categories;

  Map<String, dynamic>? _singleCategory;
  Map<String, dynamic>? get singleCategory => _singleCategory;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // ================= CREATE CATEGORY =================
  Future<void> createCategoryFunction(
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    try {
      setLoading(true);

      final url = "${Constants.baseUrl}${Constants.createCategoryUrl}";
      print("CREATE CATEGORY URL => $url");

      final response = await _postRepo.postApiRepositoryFunction(
        data,
        url,
        context,
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['data'] != null) {
        _categories.add(res['data']);
        notifyListeners();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Category created successfully")),
        );
      }
    } catch (e) {
      setLoading(false);
      print("CREATE CATEGORY ERROR: $e");
    }
  }

  // ================= GET ALL =================
  Future<void> getAllCategoriesFunction() async {
    try {
      setLoading(true);

      final url = "${Constants.baseUrl}${Constants.getCategoriesUrl}";
      print("GET ALL CATEGORY URL => $url");

      final response = await _getRepo.getApiRepositoryFunction(
        url: url,
        token: "",
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['data'] != null) {
        _categories = res['data'];
        notifyListeners();
      }
    } catch (e) {
      setLoading(false);
      print("GET CATEGORY ERROR: $e");
    }
  }

  // ================= GET BY ID =================
  Future<void> getCategoryByIdFunction(String id) async {
    try {
      setLoading(true);

      final url = "${Constants.baseUrl}${Constants.getCategoryByIdUrl}$id";

      final response = await _getRepo.getApiRepositoryFunction(
        url: url,
        token: "",
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['data'] != null) {
        _singleCategory = res['data'];
        notifyListeners();
      }
    } catch (e) {
      setLoading(false);
      print("GET CATEGORY BY ID ERROR: $e");
    }
  }

  // ================= UPDATE =================
  Future<void> updateCategoryFunction(
    String id,
    Map<String, dynamic> data,
    BuildContext context,
  ) async {
    try {
      setLoading(true);

      final url = "${Constants.baseUrl}${Constants.updateCategoryUrl}$id";

      final response = await _putRepo.authorizedPutApiRepositoryFunction(
        data,
        url,
        "",
        context,
      );

      setLoading(false);

      final res = response is String ? jsonDecode(response) : response;

      if (res != null && res['data'] != null) {
        int index = _categories.indexWhere((e) => e['_id'] == id);

        if (index != -1) {
          _categories[index] = res['data'];
        }

        notifyListeners();
      }
    } catch (e) {
      setLoading(false);
      print("UPDATE CATEGORY ERROR: $e");
    }
  }

  // ================= DELETE =================
  Future<void> deleteCategoryFunction(String id, BuildContext context) async {
    try {
      setLoading(true);

      final url = "${Constants.baseUrl}${Constants.deleteCategoryUrl}$id";

      final response = await _getRepo.getApiRepositoryFunction(
        url: url,
        token: "",
      );

      setLoading(false);

      _categories.removeWhere((item) => item['_id'] == id);
      notifyListeners();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Category deleted")));
    } catch (e) {
      setLoading(false);
      print("DELETE CATEGORY ERROR: $e");
    }
  }
}
