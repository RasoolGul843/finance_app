import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/utils/constrents/app_text_style/app_textstyle.dart';
import 'package:finance_app/view/app_screens/authentication_screens/login_screen.dart';
import 'package:finance_app/view/components/custom_button.dart';
import 'package:finance_app/view/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CreateAccountScreen> {
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
            SizedBox(height: 40.h),
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
            SizedBox(height: 30.h),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Center(child: Text("Or join with")),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Row(
                children: [
                  ////////////// google
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, left: 15),
                          child: Image.asset(AppImages.appLogo),
                        ),
                        Text(
                          "Google",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    height: 50.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color.fromARGB(255, 226, 217, 217),
                    ),
                  ),
                  SizedBox(width: 10.w),

                  ////////////apple
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Image.asset(
                            AppImages.appleIcon,
                            height: 22.h,
                            width: 22.w,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Apple",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    height: 50.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: const Color.fromARGB(255, 226, 217, 217),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account?  ",
                        style: TextStyle(
                          color: Color(0xff596064),
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: "Log In",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
