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
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Connect your bank",
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "SEARCH HERE",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.6.w,
              ),
            ),
            SizedBox(height: 8.5.h),
            CustomTextField(
              width: 342.w,
              labelText: "Search Bank Name Here",
              fillColor: Color(0xfffF0F4F7),
              height: 58.h,
              borderRadius: 16,
              labelFontSize: 16.sp,
              labelColor: Color(0xffff747C8099),

              prefixIcon: Image.asset(
                AppImages.searchIcon,
                height: 16.h,
                width: 16.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Container(
                  height: 163.h,
                  width: 148.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 233, 233),
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            AppImages.addExpensesIcon,
                            height: 48.h,
                            width: 48.w,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Text(
                            "Add Expenses",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  height: 148.h,
                  width: 148.w,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 233, 233),
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            AppImages.addNewGoalIcon,
                            height: 48.h,
                            width: 48.w,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Text(
                            "New Goal",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
