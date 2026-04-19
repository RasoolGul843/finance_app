import 'package:finance_app/utils/constrents/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastmessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: AppColors.green);
  }

  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: AppColors.green, content: Text(message)),
    );
  }
}
