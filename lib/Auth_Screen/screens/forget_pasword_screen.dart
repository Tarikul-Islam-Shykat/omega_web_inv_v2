
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/Auth_Screen/screens/otp_very_screen.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';

import '../controller/forget_pasword_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final ForgetPasswordController controller = Get.put(
    ForgetPasswordController(),
  );

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
                      'Reset Password',
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
                      'Please enter your email to reset the\npassword.',
                      style: TextStyle(
                        color: const Color(0xFFACACAC),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 64.h),

                // Email Field
                CustomTextField(
                  prefixIconPath: 'assets/images/mail.png',
                  hintText: 'Your Email',
                  textEditingController: controller.emailController,
                  fontSize: fontSize16,
                  fontWeight: FontWeight.w400,
                  lineHeight: lineHeightFactor,
                  width: screenWidth * 0.9,
                ),
                SizedBox(height: 350.h),
                // Submit Button
                CustomButton(
                  onPressed: () {
                    Get.to(() => OTPVerificationScreen());
                  },
                  text: 'Sign In',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
