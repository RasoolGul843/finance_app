import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/utils/constrents/app_text_style/app_textstyle.dart';
import 'package:finance_app/view/components/custom_button.dart';
import 'package:finance_app/view/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppImages.loginImage,
                height: 48.h,
                width: 48.w,
              ),
            ),
            Center(child: Text("Sanctuary", style: AppTextStyles.headingbold)),
            Center(
              child: Text(
                "Create your financial safe haven",
                style: AppTextStyles.subHeading.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Full Name",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6.w,
              ),
            ),
            SizedBox(height: 8.5.h),
            CustomTextField(
              width: 342.w,
              labelText: "Enter Your Legal Name",
              fillColor: Color(0xfffF0F4F7),
              height: 58.h,
              borderRadius: 16,
              labelFontSize: 16.sp,
              labelColor: Color(0xffff747C8099),

              prefixIcon: Image.asset(
                AppImages.userIcon,
                height: 16.h,
                width: 16.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 23.h),
            Text(
              "EMAIL ADDRESS",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6.w,
              ),
            ),
            SizedBox(height: 8.5.h),
            CustomTextField(
              width: 342.w,
              labelText: "rasool@gmail.com",
              fillColor: Color(0xfffF0F4F7),
              height: 58.h,
              borderRadius: 16,
              labelFontSize: 16.sp,
              labelColor: Color(0xffff747C8099),

              prefixIcon: Image.asset(
                AppImages.emailIcon,
                height: 16.h,
                width: 16.w,
                fit: BoxFit.contain,
              ),
              isPassword: true,
            ),
            SizedBox(height: 23.h),
            Text(
              "PASSWORD",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6.w,
              ),
            ),
            SizedBox(height: 8.5.h),
            CustomTextField(
              width: 342.w,
              labelText: "Enter Your Password",
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
              isPassword: true,
            ),
            Center(
              child: CustomButton(
                height: 59,
                width: 280.w,
                text: "Sign Up",

                backgroundColor: const Color(0xFF4388FD),
                borderRadius: 16,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFFFFFF),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
