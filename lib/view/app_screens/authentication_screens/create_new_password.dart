import 'dart:ffi';

import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/utils/constrents/app_text_style/app_textstyle.dart';
import 'package:finance_app/view/app_screens/authentication_screens/login_screen.dart';
import 'package:finance_app/view/components/custom_button.dart';
import 'package:finance_app/view/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Lumina Finance")),
      body: Padding(
        padding: EdgeInsets.only(top: 80.h),
        child: Column(
          children: [
            Image.asset(AppImages.newpasswordIcon, height: 64.h, width: 64.w),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                "Create New Password",
                style: AppTextStyles.headingbold.copyWith(fontSize: 24.sp),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                "Your new password must be different \n          from previous passwords.",
              ),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.only(right: 230.w),
              child: Text(
                "NEW PASSWORD",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6.w,
                ),
              ),
            ),
            SizedBox(height: 8.5.h),
            CustomTextField(
              isPassword: true,
              width: 342.w,
              labelText: ". . . . .",
              fillColor: Color(0xfffF0F4F7),
              height: 58.h,
              borderRadius: 16,
              labelFontSize: 16.sp,
              labelColor: Color(0xffff747C8099),

              prefixIcon: Image.asset(
                AppImages.passwordIcon,
                height: 16.h,
                width: 16.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(right: 170.w),
              child: Text(
                "CONFIRM NEW PASSWORD",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.6.w,
                ),
              ),
            ),
            SizedBox(height: 8.5.h),
            CustomTextField(
              isPassword: true,
              width: 342.w,
              labelText: ". . . . .",
              fillColor: Color(0xfffF0F4F7),
              height: 58.h,
              borderRadius: 16,
              labelFontSize: 16.sp,
              labelColor: Color(0xffff747C8099),

              prefixIcon: Image.asset(
                AppImages.passwordIcon,
                height: 16.h,
                width: 16.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 60.h),
            Center(
              child: CustomButton(
                height: 59,
                width: 280.w,
                text: "Reset Password",

                backgroundColor: const Color(0xFF4388FD),
                borderRadius: 16,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFFFFF),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.only(left: 110.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(AppImages.backArrow, height: 12.h, width: 12.w),
                    SizedBox(width: 10.w),
                    Text(
                      "Back to Log In",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
