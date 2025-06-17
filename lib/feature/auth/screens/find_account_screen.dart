import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/const/app_loader.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';

import '../controller/forget_pasword_controller.dart';


class FindAccountScreen extends StatelessWidget {
  final ForgetPasswordController controller = Get.put(ForgetPasswordController());
  FindAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/acc_found.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
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
                        color: const Color(0xFFFB4958),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50.h),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '  Email',
                        style: TextStyle(
                          color: const Color(0xFFFFFFFF),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    CustomTextField(
                      textEditingController: controller.emailController.value,
                      fillColor: Color(0xFFFFFFFF).withAlpha(40),
                      hintText: 'Email',
                    ),

                    SizedBox(height: 40.h),

                    // Removed the Obx wrapper since isForgotPasswordLoading is not available
                    Obx((){
                        return controller.isLoading.value?loader():CustomButton(
                          onPressed: () async {
                            controller.sendOtpToEmail();
                          },
                          text: 'Search',
                          textColor: Colors.white,
                          backgroundColor: const Color(0xFFFB4958),
                          width: screenWidth * 0.9,
                          height: 40.h,
                          borderRadius: 10.r,
                        );
                      }
                    ),
                    SizedBox(height: 15.h),

                    CustomButton(
                      text: 'Cancel',
                      textColor: const Color(0xFFFFFFFF),
                      backgroundColor: Colors.transparent,
                      borderSide: BorderSide(color: Color(0xFFFB4958)),
                      width: screenWidth * 0.9,
                      height: 40.h,
                      borderRadius: 10.r,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
