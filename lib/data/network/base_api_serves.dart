import 'package:flutter/material.dart';

abstract class BaseApiServices {
  Future<dynamic> getApi(String url, BuildContext context);

  Future<dynamic> postApi(String url, dynamic data, BuildContext context);
  Future<dynamic> putApi(dynamic data, String url, BuildContext context);

  Future<dynamic> authorizedPutApi(
    var data,
    String url,
    String token,
    BuildContext context,
  );
  Future<void> authorizedPostApiWithDataInBody(
    var data,
    String url,
    String token,
    BuildContext context,
  );
}
