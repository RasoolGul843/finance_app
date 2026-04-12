import 'package:finance_app/view/app_screens/authentication_screens/create_new_password.dart';
import 'package:finance_app/view/app_screens/authentication_screens/forget_screen.dart';
import 'package:finance_app/view/app_screens/authentication_screens/splash_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        );
      },
    );
  }
}
