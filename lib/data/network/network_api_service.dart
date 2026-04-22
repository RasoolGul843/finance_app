import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NetworkService {
  /// POST API
  /// AUTHORIZED POST
  Future<dynamic> authorizedPostApi({
    required String url,
    required dynamic body,

    required BuildContext context,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    return _returnResponse(response);
  }

  Future<dynamic> tokenAuthorizedPostApi({
    required String url,
    required dynamic body,
    required String token,
    required BuildContext context,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(body),
    );

    return _returnResponse(response);
  }

  /// PUT API (AUTHORIZED)
  Future<dynamic> authorizedPutApi({
    required String url,
    required dynamic body,
    required String token,
    required BuildContext context,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
      );

      return _returnResponse(response);
    } catch (e) {
      throw Exception("PUT API ERROR: $e");
    }
  }

  /// GET API (AUTHORIZED)
  Future<dynamic> getApi({required String url, required String token}) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization": "Bearer $token"},
      );

      return _returnResponse(response);
    } catch (e) {
      throw Exception("GET API ERROR: $e");
    }
  }

  /// DELETE API
  Future<dynamic> deleteApi({
    required String url,
    required String token,
  }) async {
    final response = await http.delete(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"},
    );

    return _returnResponse(response);
  }

  /// COMMON RESPONSE HANDLER
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);

      case 400:
        throw Exception(jsonDecode(response.body)['message']);

      case 401:
        throw Exception("Unauthorized");

      case 404:
        throw Exception("Not Found");

      case 500:
        throw Exception("Server Error");

      default:
        throw Exception("Unexpected Error: ${response.statusCode}");
    }
  }
}
