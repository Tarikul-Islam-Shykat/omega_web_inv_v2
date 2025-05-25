import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import '../controller/login_controller.dart';
import 'otp_very_screen.dart';

class FindAccountScreen extends StatelessWidget {
  final String email;
  final LoginController controller = Get.put(LoginController());

  FindAccountScreen({this.email = '', super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    nameController.text = email;

    return Scaffold(
      backgroundColor: const Color(0xFFE9EBF0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Find Your Account',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: const Color(0xFF4A4F5E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Username',
                    style: TextStyle(
                      color: const Color(0xFF4A4F5E),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                TextField(
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                // Removed the Obx wrapper since isForgotPasswordLoading is not available
                CustomButton(
                  onPressed: () async {
                    // await controller.forgotPassword(
                    //   email: nameController.text.trim(),
                    // );

                    Get.to(
                      () => OTPVerificationScreen(
                        email: nameController.text.trim(),
                      ),
                    );
                  },
                  text: 'Search',
                  textColor: Colors.white,
                  backgroundColor: const Color(0xFF1F3892),
                  width: screenWidth * 0.9,
                  borderRadius: 30,
                ),
                SizedBox(height: 15.h),

                CustomButton(
                  text: 'Cancel',
                  textColor: const Color(0xFF1F3892),
                  backgroundColor: Colors.white,
                  width: screenWidth * 0.9,
                  borderRadius: 30,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
