import 'dart:io';
import 'package:finance_app/utils/constrents/app_images/app_images.dart';
import 'package:finance_app/view/components/custom_button.dart';
import 'package:finance_app/view/components/custom_textfield.dart';
import 'package:finance_app/view_models/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  /// Pick Image from Gallery
  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = Provider.of<UserProvider>(context, listen: false);

    nameController.text = user.userName ?? "";
    emailController.text = user.userEmail ?? "";
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
            text: "Save Changes",
            backgroundColor: const Color(0xFF4388FD),
            borderRadius: 16,
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            onTap: () {
              final provider = Provider.of<UserProvider>(
                context,
                listen: false,
              );

              provider.updateProfileFunction({
                "name": nameController.text,
                "email": emailController.text,
                "phone": phoneController.text,
                "image": provider.userImage ?? "",
              }, context);
            },
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
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),

      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return Padding(
            padding: EdgeInsets.all(24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// PROFILE IMAGE + CAMERA ICON
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Colors.grey.shade200,

                          // ✅ PRIORITY: local image → network image → icon
                          backgroundImage: _image != null
                              ? FileImage(_image!)
                              : (userProvider.userImage != null &&
                                    userProvider.userImage!.isNotEmpty)
                              ? NetworkImage(userProvider.userImage!)
                              : null,

                          child:
                              (_image == null &&
                                  (userProvider.userImage == null ||
                                      userProvider.userImage!.isEmpty))
                              ? Icon(
                                  Icons.person,
                                  size: 50.sp,
                                  color: Colors.grey,
                                )
                              : null,
                        ),

                        /// Camera Icon
                        GestureDetector(
                          onTap: pickImage,
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: const BoxDecoration(
                              color: Color(0xFF4388FD),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// USER NAME
                  Center(
                    child: Text(
                      "Rasool Gul",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  Text(
                    "FULL NAME",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6.w,
                    ),
                  ),
                  SizedBox(height: 8.5.h),
                  CustomTextField(
                    controller: nameController,
                    width: 342.w,
                    labelText: "Rasool Gul",
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
                    controller: emailController,
                    width: 342.w,
                    labelText: "rasoolgul@example.com",
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
                    "PHONE NUMBER",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6.w,
                    ),
                  ),
                  SizedBox(height: 8.5.h),
                  CustomTextField(
                    controller: phoneController,
                    width: 342.w,
                    labelText: "03341449995",
                    fillColor: Color(0xfffF0F4F7),
                    height: 58.h,
                    borderRadius: 16,
                    labelFontSize: 16.sp,
                    labelColor: Color(0xffff747C8099),

                    prefixIcon: Image.asset(
                      AppImages.phoneIcon,
                      height: 16.h,
                      width: 16.w,
                      fit: BoxFit.contain,
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
