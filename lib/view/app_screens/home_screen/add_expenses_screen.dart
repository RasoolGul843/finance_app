import 'package:finance_app/view/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({super.key});

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  String? selectedCategory;
  DateTime? selectedDate;

  final List<String> categories = [
    "Food",
    "Shopping",
    "Transport",
    "Health",
    "Entertainment",
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 40.h),
          child: CustomButton(
            height: 59,
            width: double.infinity,
            text: "Save Expense",
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
          "Add Expense",
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
                "ENTER AMOUNT",
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

            SizedBox(height: 30.h),

            // ---------------- CATEGORY ----------------
            Text(
              "CATEGORY",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10.h),

            Container(
              height: 59.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xffF0F4F7),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: const Text("Select Category"),
                  items: categories.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
              ),
            ),

            SizedBox(height: 25.h),

            // ---------------- DATE ----------------
            Text(
              "TRANSACTION DATE",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10.h),

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
            SizedBox(height: 25.h),

            Text(
              "NOTE:",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xffF0F4F7),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: TextField(
                maxLines: 4, // ⭐ allows multiple lines
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
