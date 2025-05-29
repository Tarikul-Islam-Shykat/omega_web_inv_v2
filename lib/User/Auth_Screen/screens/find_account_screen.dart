import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/forget_pass_otp_verification.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';
import '../controller/login_controller.dart';

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
                      textEditingController: nameController,
                      fillColor: Color(0xFFFFFFFF).withAlpha(40),
                      hintText: 'Email',
                    ),

                    // TextField(
                    //   controller: nameController,
                    //   autofocus: true,
                    //   decoration: InputDecoration(
                    //     labelText: 'Username',
                    //     filled: true,
                    //     fillColor: Colors.white,
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     contentPadding: const EdgeInsets.symmetric(
                    //       horizontal: 15,
                    //       vertical: 10,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 40.h),

                    // Removed the Obx wrapper since isForgotPasswordLoading is not available
                    CustomButton(
                      onPressed: () async {
                        // await controller.forgotPassword(
                        //   email: nameController.text.trim(),
                        // );

                        Get.to(
                          () => ForgetPassOtpVerification(
                            email: nameController.text.trim(),
                          ),
                        );
                      },
                      text: 'Search',
                      textColor: Colors.white,
                      backgroundColor: const Color(0xFFFB4958),
                      width: screenWidth * 0.9,
                      height: 40.h,
                      borderRadius: 10.r,
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
