import 'dart:ui';

import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/utils/constrents/app_text_style/app_textstyle.dart';
import 'package:finance_app/view/app_screens/authentication_screens/login_screen.dart';
import 'package:finance_app/view/components/custom_button.dart';
import 'package:finance_app/view/components/custom_textfield.dart';
import 'package:finance_app/view_models/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CreateAccountScreen> {
  // ✅ ADD CONTROLLERS
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
            child: SingleChildScrollView(
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
                  Center(
                    child: Text("Sanctuary", style: AppTextStyles.headingbold),
                  ),
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

                  Text("Full Name"),
                  SizedBox(height: 8.5.h),
                  CustomTextField(
                    controller: nameController, // ✅ ADD
                    width: 342.w,
                    labelText: "Enter Your Legal Name",
                    fillColor: Color(0xfffF0F4F7),
                    height: 58.h,
                    borderRadius: 16,
                    labelFontSize: 16.sp,
                    labelColor: Color(0xffff747C8099),
                    prefixIcon: Image.asset(AppImages.userIcon, height: 18.h),
                  ),

                  SizedBox(height: 23.h),

                  Text("EMAIL ADDRESS"),
                  SizedBox(height: 8.5.h),
                  CustomTextField(
                    controller: emailController, // ✅ ADD
                    width: 342.w,
                    labelText: "rasool@gmail.com",
                    fillColor: Color(0xfffF0F4F7),
                    height: 58.h,
                    borderRadius: 16,
                    labelFontSize: 16.sp,
                    labelColor: Color(0xffff747C8099),
                    prefixIcon: Image.asset(AppImages.emailIcon, height: 15.h),
                  ),

                  SizedBox(height: 23.h),

                  Text("PASSWORD"),
                  SizedBox(height: 8.5.h),
                  CustomTextField(
                    controller: passwordController, // ✅ ADD
                    width: 342.w,
                    labelText: "Enter Your Password",
                    fillColor: Color(0xfffF0F4F7),
                    height: 58.h,
                    borderRadius: 16,
                    labelFontSize: 16.sp,
                    labelColor: Color(0xffff747C8099),
                    prefixIcon: Image.asset(
                      AppImages.passwordIcon,
                      height: 18.h,
                    ),
                    isPassword: true,
                  ),

                  SizedBox(height: 30.h),

                  Center(
                    child:
                        provider
                            .loading // ✅ LOADER
                        ? const CircularProgressIndicator()
                        : CustomButton(
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
                              // ✅ DATA MAP
                              Map<String, dynamic> data = {
                                "name": nameController.text,
                                "email": emailController.text,
                                "password": passwordController.text,
                              };

                              provider.signUpFunction(data, context);
                            },
                          ),
                  ),

                  SizedBox(height: 20.h),
                  Center(child: Text("Or join with")),
                  SizedBox(height: 20.h),

                  // (Your Google + Apple UI untouched)
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
        },
      ),
    );
  }
}
