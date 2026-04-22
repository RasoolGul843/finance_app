import 'package:finance_app/data/network/network_api_service.dart';
import 'package:flutter/material.dart';

class PostApiRepository {
  final NetworkService _networkService = NetworkService();

  /// 🔹 SIMPLE POST (NO TOKEN)
  Future<dynamic> postApiRepositoryFunction(
    dynamic data,
    String url,
    BuildContext context,
  ) async {
    try {
      final response = await _networkService.authorizedPostApi(
        url: url,
        body: data,

        context: context,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// 🔹 AUTHORIZED POST (WITH TOKEN)
  Future<dynamic> authorizedPostApiRepositoryFunction(
    dynamic data,
    String url,
    String token,
    BuildContext context,
  ) async {
    try {
      final response = await _networkService.tokenAuthorizedPostApi(
        url: url,
        body: data,
        token: token,
        context: context,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
