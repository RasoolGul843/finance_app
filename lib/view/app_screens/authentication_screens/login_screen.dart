import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/utils/constrents/app_text_style/app_textstyle.dart';
import 'package:finance_app/view/app_screens/authentication_screens/create_account_screen.dart';
import 'package:finance_app/view/app_screens/authentication_screens/forget_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/home_screen.dart';
import 'package:finance_app/view/components/custom_button.dart';
import 'package:finance_app/view/components/custom_textfield.dart';
import 'package:finance_app/view_models/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 90.h, horizontal: 20.w),
        child: Consumer<UserProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Welcome Back",
                      style: AppTextStyles.headingbold,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Sign in to Lumina Finance to continue your\n                              journey.",
                      style: AppTextStyles.subHeading.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: CustomButton(
                      height: 59,
                      width: 280.w,
                      text: "Continue with Google",
                      leftIcon: "assets/icons/SVG.png",
                      backgroundColor: Colors.grey,
                      borderRadius: 16,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff2C3437),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(child: Text("OR EMAIL")),

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
                    controller: emailController,
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
                  Row(
                    children: [
                      Text(
                        "PASSWORD",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6.w,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "FORGET PASSWORD",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.6.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.5.h),
                  CustomTextField(
                    controller: passwordController,
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
                              Map<String, dynamic> data = {
                                "email": emailController.text,
                                "password": passwordController.text,
                              };

                              provider.loginFunction(data, context);
                            },
                          ),
                  ),

                  SizedBox(height: 40.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountScreen(),
                        ),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account?  ",
                              style: TextStyle(
                                color: Color(0xff596064),
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: "Sign Up",
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
            );
          },
        ),
      ),
    );
  }
}
