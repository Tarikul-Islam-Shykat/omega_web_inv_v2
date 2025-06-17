import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';
import '../controller/signup_controller.dart';
import 'otp_very_screen.dart';

class SignUpScreen extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/signup.png',
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFB4958),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Email
                  _label("  Email"),
                  CustomTextField(
                    width: screenWidth * 0.9,
                    hintText: 'Email',
                    textEditingController: controller.emailController,
                    fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                  ),

                  // Phone Number
                  _label("  Phone Number"),
                  CustomTextField(
                    width: screenWidth * 0.9,
                    hintText: 'Phone',
                    textEditingController: controller.phoneController,
                    fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                  ),

                  // Date of Birth
                  _label("  Date of Birth"),
                  GestureDetector(
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        controller.dobController.text =
                            picked.toIso8601String().split('T')[0];
                      }
                    },
                    child: AbsorbPointer(
                      child: CustomTextField(
                        // textColor: Colors.white,
                        fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                        width: screenWidth * 0.9,
                        hintText: 'Date of Birth',
                        textEditingController: controller.dobController,
                      ),
                    ),
                  ),

                  // Referral/Partner Code
                  _label("  Referral Code"),
                  CustomTextField(
                    fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                    width: screenWidth * 0.9,
                    hintText: 'Referral Code',
                    textEditingController: controller.referralCodeController,
                  ),

                  SizedBox(height: screenHeight * 0.01),
                  // Password
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '  Password',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Obx(
                    () => CustomTextField(
                      fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                      width: screenWidth * 0.9,
                      hintText: '*********',
                      obscureText: !controller.isPasswordVisible.value,
                      textEditingController: controller.passwordController,
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     controller.isPasswordVisible.value
                      //         ? Icons.visibility
                      //         : Icons.visibility_off,
                      //   ),
                      //   onPressed: controller.togglePasswordVisibility,
                      // ),
                    ),
                  ),

                  // Confirm Password
                  _label("  Confirm Password"),
                  Obx(
                    () => CustomTextField(
                      fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                      width: screenWidth * 0.9,
                      // validator: controller.validateStrongPassword,
                      hintText: '*********',
                      obscureText: !controller.isConfirmPasswordVisible.value,
                      textEditingController:
                          controller.confirmPasswordController,
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     controller.isConfirmPasswordVisible.value
                      //         ? Icons.visibility
                      //         : Icons.visibility_off,
                      //   ),
                      //   onPressed: controller.toggleConfirmPasswordVisibility,
                      // ),
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Sign Up Button
                  Obx(
                    () =>
                        controller.isLoading.value
                            ? Center(
                              child: SpinKitWave(color: Color(0xFFFB4958)),
                            )
                            : SizedBox(
                              width: screenWidth * 0.9,
                              height: 40.h,
                              child: ElevatedButton(
                                // onPressed: controller.registerUser,
                                onPressed: () {
                                  Get.to(
                                    () => OTPVerificationScreen(
                                      email: controller.emailController.text,
                                      isForSignUp: true,
                                    ),
                                  );
                                  Get.snackbar(
                                    'Great Work!',
                                    'Sign Up Successfully!',
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    snackPosition: SnackPosition.TOP,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFB4958),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
    child: Text(text, style: const TextStyle(color: Color(0xFFFFFFFF))),
  );
}
