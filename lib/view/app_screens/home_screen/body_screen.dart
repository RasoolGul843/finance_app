import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/view/app_screens/goal_screens/new_goal_screen.dart';
import 'package:finance_app/view/app_screens/home_screen/add_expenses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "What would you",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w400),
            ),
            Text(
              "like to record?",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20.h),
            Text(
              "Capture your financial moments instantly.",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExpensesScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 163.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.addExpensesIcon,
                            height: 48.h,
                            width: 48.w,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Add Expenses",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Log a daily spend",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => NewGoalScreen()),
                    );
                  },
                  child: Container(
                    height: 163.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.addNewGoalIcon,
                            height: 48.h,
                            width: 48.w,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "New Goal",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Start saving up",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddExpensesScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 163.h,
                    width: 148.w,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            AppImages.addNewIncomeIcon,
                            height: 48.h,
                            width: 48.w,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Add Income",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Record earnings",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  height: 163.h,
                  width: 148.w,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.addReciepnt,
                          height: 48.h,
                          width: 48.w,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Scan Receipt",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Smart AI capture",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
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
