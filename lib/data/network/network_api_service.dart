import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NetworkService {
  String _defaultContentType = 'application/json; charset=utf-8';

  Future<dynamic> postApi({
    required String url,
    required Map<String, dynamic> body,
    required BuildContext context,
  }) async {
    try {
      print("POST URL ----> $url");
      print("POST BODY ----> $body");

      final http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": _defaultContentType},
        body: jsonEncode(body),
      );

      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      // ✅ ALWAYS USE RESPONSE.BODY HERE (SAFE)
      final decoded = jsonDecode(response.body);

      print("DECODED RESPONSE: $decoded");

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return decoded;
      } else {
        throw Exception(decoded['message'] ?? 'Server error');
      }
    } catch (e) {
      print("NETWORK ERROR: $e");
      rethrow;
    }
  }
}
