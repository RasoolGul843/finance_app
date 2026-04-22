import 'package:finance_app/data/network/network_api_service.dart';
import 'package:flutter/material.dart';

class PutApiRepository {
  final NetworkService _networkService = NetworkService();

  /// 🔹 AUTHORIZED PUT
  Future<dynamic> authorizedPutApiRepositoryFunction(
    dynamic data,
    String url,
    String token,
    BuildContext context,
  ) async {
    try {
      final response = await _networkService.authorizedPutApi(
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
