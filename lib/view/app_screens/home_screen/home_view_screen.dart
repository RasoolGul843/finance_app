import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  double totalBudget = 5000;
  double spentAmount = 4250;

  @override
  Widget build(BuildContext context) {
    double percentage = spentAmount / totalBudget;

    return Scaffold(
      backgroundColor: Colors.grey[100],
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

      /// ✅ FIXED BODY
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 Balance
            Center(
              child: Text(
                "\$12,450.80",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28.sp),
              ),
            ),

            SizedBox(height: 10.h),

            /// 🔹 Budget Card
            BudgetCard(
              totalBudget: totalBudget,
              spentAmount: spentAmount,
              percentage: percentage,
            ),

            SizedBox(height: 10.h),

            /// 🔹 Button
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 55.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4388FD),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/addIcon.png", width: 20),
                      const SizedBox(width: 10),
                      const Text(
                        "Add Expense",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            /// 🔹 Header Row
            Row(
              children: [
                Text(
                  "Recent Transactions",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            /// ✅ ONLY ONE Expanded (IMPORTANT)
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: const AssetImage(
                            'assets/images/shopping.png',
                          ),
                        ),

                        SizedBox(width: 12.w),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Grocery Shopping",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Aug 20, 2024",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "-\$150.00",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Walmart",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ✅ Budget Card (unchanged)
class BudgetCard extends StatelessWidget {
  final double totalBudget;
  final double spentAmount;
  final double percentage;

  const BudgetCard({
    super.key,
    required this.totalBudget,
    required this.spentAmount,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    int percentValue = (percentage * 100).toInt();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Title + Amount
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Monthly Budget",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$${spentAmount.toStringAsFixed(0)}",
                      style: const TextStyle(
                        color: Color(0xFF4388FD),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: " / \$${totalBudget.toStringAsFixed(0)}",
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 8.h),

          /// 🔹 Subtitle
          Text(
            "You've spent $percentValue% of your goal",
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),

          SizedBox(height: 15.h),

          /// 🔹 Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 10,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFF1565C0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
