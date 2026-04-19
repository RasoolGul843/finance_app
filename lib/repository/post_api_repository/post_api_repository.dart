import 'package:finance_app/data/network/network_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PostApiRepository {
  final NetworkService _networkService = NetworkService();

  Future<dynamic> postApiRepositoryFunction(
    dynamic data,
    String url,
    BuildContext context,
  ) async {
    try {
      if (kDebugMode) {
        print("POST URL ----> $url");
        print("Post payload: $data");
      }

      final response = await _networkService.postApi(
        url: url,
        body: data,
        context: context,
      );

      print("RAW RESPONSE: $response");

      // ✅ FIX: DO NOT decode again
      return response;
    } catch (e) {
      debugPrint("error in post Api Repository ----> $e");
      rethrow;
    }
  }
}
