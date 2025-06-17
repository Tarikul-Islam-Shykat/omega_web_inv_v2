
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';
import 'package:omega_web_inv/feature/Auth/screens/success_screen.dart';

import '../controller/login_controller.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize16 = screenWidth * 0.041;
    final lineHeightFactor = 1.5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button Row
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: CircleAvatar(
                        backgroundColor: const Color(
                          0xFF5D5FEF,
                        ).withOpacity(0.1),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      'Set New Password',
                      style: TextStyle(
                        color: const Color(0xFF2F2F2F),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 50.w),
                    Text(
                      maxLines: 2,
                      'Create your new password so you can\nshare info again.',
                      style: TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 64.h),

                // Password Field
                Obx(
                  () => CustomTextField(
                    prefixIconPath: 'assets/images/lock.png',
                    width: screenWidth * 0.9,
                    hintText: 'New password',
                    textEditingController: controller.passwordTEController,
                    fontSize: fontSize16,
                    fontWeight: FontWeight.w400,
                    lineHeight: lineHeightFactor,
                    obscureText: !controller.isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xff6E32A5).withAlpha(160),
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // Confirm Password Field
                Obx(
                  () => CustomTextField(
                    prefixIconPath: 'assets/images/lock.png',
                    width: screenWidth * 0.9,
                    hintText: 'Confirm  new password',
                    textEditingController: confirmPasswordController,
                    fontSize: fontSize16,
                    fontWeight: FontWeight.w400,
                    lineHeight: lineHeightFactor,
                    obscureText: !controller.isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xff6E32A5).withAlpha(160),
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(height: 250.h),
                // Submit Button
                CustomButton(
                  onPressed: () {
                    if (controller.passwordTEController.text.isEmpty ||
                        confirmPasswordController.text.isEmpty) {
                      Get.snackbar('Error', 'Both fields are required');
                      return;
                    }
                    if (controller.passwordTEController.text !=
                        confirmPasswordController.text) {
                      Get.snackbar('Error', 'Passwords do not match');
                      return;
                    }
                    // Get.to(() => OTPVerificationScreen());
                    Get.to(() => SuccessScreen());
                  },
                  text: 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
