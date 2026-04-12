import 'dart:async';
import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/utils/constrents/app_text_style/app_textstyle.dart';
import 'package:finance_app/view/app_screens/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    startLoading();
  }

  void startLoading() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        progress += 0.02;
      });

      if (progress >= 1.0) {
        timer.cancel();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          children: [
            const Spacer(),

            Column(
              children: [
                Image.asset(AppImages.appLogo, height: 96.h, width: 96.w),
                SizedBox(height: 20.h),

                Text("Lumina Finance", style: AppTextStyles.headingbold),

                SizedBox(height: 8.h),

                Text("The Digital Sanctuary", style: AppTextStyles.subHeading),
              ],
            ),

            const Spacer(),

            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6.h,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                Text("Securing your assets", style: AppTextStyles.subHeading),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
