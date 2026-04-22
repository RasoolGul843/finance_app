import 'package:finance_app/view/components/custom_button.dart';
import 'package:finance_app/view_models/categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddNewCategoryScreen extends StatefulWidget {
  const AddNewCategoryScreen({super.key});

  @override
  State<AddNewCategoryScreen> createState() => _AddNewCategoryScreenState();
}

class _AddNewCategoryScreenState extends State<AddNewCategoryScreen> {
  int selectedIconIndex = 1;
  int selectedColorIndex = 0;

  final TextEditingController nameController = TextEditingController();

  final List<IconData> icons = [
    Icons.home_outlined,
    Icons.shopping_bag_outlined,
    Icons.restaurant_outlined,
    Icons.directions_car_outlined,
    Icons.account_balance_wallet_outlined,
    Icons.fitness_center_outlined,
    Icons.medical_services_outlined,
    Icons.flight_outlined,
    Icons.movie_outlined,
    Icons.school_outlined,
    Icons.pets_outlined,
    Icons.card_giftcard_outlined,
  ];

  final List<Color> colors = [
    Color(0xff3B82F6),
    Color(0xffEF4444),
    Color(0xff6D5B8C),
    Color(0xff14B8A6),
    Color(0xffEAB308),
    Color(0xff1F2937),
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,

      /// ✅ CONSUMER ADDED HERE
      bottomNavigationBar: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(24.w, 10.h, 24.w, 10.h),
              child: CustomButton(
                height: 59,
                width: double.infinity,
                text: provider.loading ? "Creating..." : "Create Category",
                backgroundColor: const Color(0xFF4388FD),
                borderRadius: 16,
                textStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                onTap: () {
                  /// ✅ VALIDATION
                  if (nameController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter category name"),
                      ),
                    );
                    return;
                  }

                  /// ✅ DATA SEND TO API
                  final data = {
                    "name": nameController.text.trim(),
                    "icon": icons[selectedIconIndex].codePoint.toString(),
                    "color": colors[selectedColorIndex].value.toString(),
                  };

                  provider.createCategoryFunction(data, context);
                },
              ),
            ),
          );
        },
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue, size: 22.sp),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Category",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              Center(
                child: Container(
                  height: 90.h,
                  width: 90.h,
                  decoration: BoxDecoration(
                    color: colors[selectedColorIndex].withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icons[selectedIconIndex],
                    size: 36.sp,
                    color: colors[selectedColorIndex],
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              Center(
                child: Text(
                  "Add New Category",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              Text(
                "CATEGORY NAME",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 10.h),

              Container(
                height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Color(0xffF0F4F7),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      icons[selectedIconIndex],
                      color: Colors.grey,
                      size: 20.sp,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextField(
                        controller: nameController,

                        /// ✅ ADDED
                        decoration: InputDecoration(
                          hintText: "Enter Category Name",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              Text(
                "SELECT ICON",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 15.h),

              GridView.builder(
                shrinkWrap: true,
                itemCount: icons.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 14.h,
                  crossAxisSpacing: 14.w,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  bool isSelected = selectedIconIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIconIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        icons[index],
                        size: 22.sp,
                        color: Colors.black87,
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 25.h),

              Text(
                "SELECT COLOR THEME",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 15.h),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(colors.length + 1, (index) {
                    if (index == colors.length) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: Container(
                          height: 44.h,
                          width: 44.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: Icon(Icons.edit, size: 18.sp),
                        ),
                      );
                    }

                    bool isSelected = selectedColorIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColorIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: Container(
                          height: 44.h,
                          width: 44.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors[index],
                            border: Border.all(
                              color: isSelected
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
