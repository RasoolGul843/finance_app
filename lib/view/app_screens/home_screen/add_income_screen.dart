import 'package:finance_app/view/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  int selectedIndex = -1;
  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final List<Map<String, dynamic>> incomeList = [
    {"icon": Icons.work, "title": "Salary", "subtitle": "Payroll"},
    {"icon": Icons.business, "title": "Business", "subtitle": "Income"},
    {"icon": Icons.card_giftcard, "title": "Gift", "subtitle": "Bonus"},
    {"icon": Icons.trending_up, "title": "Investment", "subtitle": "Returns"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 20.h),
          child: CustomButton(
            height: 59,
            width: double.infinity,
            text: "Save Income",
            backgroundColor: const Color(0xFF4388FD),
            borderRadius: 16,
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            onTap: () {},
          ),
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Add Income",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "ENTER RECEIVED",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),

            TextField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                hintText: "\$0.00",
                hintStyle: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                ),
                border: InputBorder.none,
              ),
            ),

            SizedBox(height: 20.h),

            Text(
              "INCOME SOURCE",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 15.h),

            /// GRID VIEW
            Expanded(
              child: GridView.builder(
                itemCount: incomeList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.h,
                  crossAxisSpacing: 15.w,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF4388FD)
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Stack(
                        children: [
                          /// Tick Icon
                          if (isSelected)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Icon(
                                Icons.check_circle,
                                color: const Color(0xFF4388FD),
                                size: 20.sp,
                              ),
                            ),

                          /// Content
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                incomeList[index]["icon"],
                                size: 30.sp,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                incomeList[index]["title"],
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                incomeList[index]["subtitle"],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: pickDate,
              child: Container(
                height: 59.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF0F4F7),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.grey),
                    SizedBox(width: 10.w),
                    Text(
                      selectedDate == null
                          ? "Select Date"
                          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                    ),
                    const Spacer(),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),

            SizedBox(height: 15.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xffF0F4F7),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                maxLines: 4,
                minLines: 3,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Write description...",
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
