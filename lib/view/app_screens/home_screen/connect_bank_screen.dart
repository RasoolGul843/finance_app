import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/view/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectBankScreen extends StatefulWidget {
  const ConnectBankScreen({super.key});

  @override
  State<ConnectBankScreen> createState() => _ConnectBankScreenState();
}

class _ConnectBankScreenState extends State<ConnectBankScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            SizedBox(width: 10),
            Text(
              "Rasool Gul",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== FIXED PART (NO SCROLL) =====
            Center(
              child: Text(
                "Connect your bank",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w800),
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              "SEARCH HERE",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 8.h),

            CustomTextField(
              width: 342.w,
              labelText: "Search Bank Name Here",
              fillColor: const Color(0xffF0F4F7),
              height: 58.h,
              borderRadius: 16,
              labelFontSize: 16.sp,
              labelColor: const Color(0xff747C80),
              prefixIcon: Image.asset(
                AppImages.searchIcon,
                height: 16.h,
                width: 16.w,
              ),
            ),

            SizedBox(height: 30.h),

            Row(
              children: [
                Text(
                  "Popular institutions",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                Text(
                  "view all",
                  style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            /// ===== SCROLLABLE PART =====
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /// GRID
                    Row(
                      children: [
                        Container(
                          height: 163.h,
                          width: 148.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 233, 233),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.bankLogo,
                                height: 52.h,
                                width: 52.w,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Meezan Bank",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20.w),

                        Container(
                          height: 163.h,
                          width: 148.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 233, 233),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.bankLogo,
                                height: 52.h,
                                width: 52.w,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "UBL Bank",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    Row(
                      children: [
                        Container(
                          height: 163.h,
                          width: 148.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 233, 233),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.bankLogo,
                                height: 52.h,
                                width: 52.w,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Meezan Bank",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20.w),

                        Container(
                          height: 163.h,
                          width: 148.w,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 241, 233, 233),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppImages.bankLogo,
                                height: 52.h,
                                width: 52.w,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "UBL Bank",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Others",
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    /// LIST
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppImages.bankLogo,
                                  height: 32.h,
                                  width: 32.w,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "Bank Name",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Image.asset(
                                  AppImages.forwordArrow,
                                  height: 16.h,
                                  width: 16.w,
                                ),
                              ],
                            ),
                            height: 58.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 241, 233, 233),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        );
                      },
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
