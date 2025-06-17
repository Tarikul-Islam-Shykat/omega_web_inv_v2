// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';

import '../controller/login_controller.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  ResetPasswordScreen({this.email = "", super.key});

  final LoginController controller = Get.put(LoginController());

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE9EBF0),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF4A4F5E),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // New Password
                  CustomTextField(
                    textEditingController: newPasswordController,
                    hintText: 'New password',
                    bacgroundColor: Colors.white,
                    width: screenWidth * 0.9,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Confirm Password
                  CustomTextField(
                    textEditingController: confirmPasswordController,
                    hintText: 'Confirm password',
                    bacgroundColor: Colors.white,
                    width: screenWidth * 0.9,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),

                  SizedBox(height: 80.h),

                  CustomButton(
                    onPressed: () {
                      /*
                      if (newPasswordController.text != confirmPasswordController.text) {
                        return;
                      }
                      if (newPasswordController.text.length < 8) {
                        return;
                      }
                      */

                      Get.offAll(() => LoginScreen());
                    },
                    text: 'Save',
                    textColor: Colors.white,
                    backgroundColor: const Color(0xFF1F3892),
                    width: screenWidth * 0.9,
                    borderRadius: 10,
                  ),

                  SizedBox(height: screenHeight * 0.05),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
