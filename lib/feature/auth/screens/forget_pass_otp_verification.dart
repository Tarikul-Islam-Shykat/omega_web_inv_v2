// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import 'forget_pasword_screen.dart';

class ForgetPassOtpVerification extends StatefulWidget {
  final String? email;

  const ForgetPassOtpVerification({super.key, this.email});

  @override
  _ForgetPassOtpVerificationState createState() =>
      _ForgetPassOtpVerificationState();
}

class _ForgetPassOtpVerificationState extends State<ForgetPassOtpVerification> {
  final _otpController = TextEditingController();
  final controller = Get.put(LoginController());

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 22.sp, color: Color(0xFFFB4958)),
    decoration: BoxDecoration(
      color: Color(0xFFFFFFFF).withAlpha(40),
      // border: Border.all(
      //   color: Color(
      //     0xFF1F3892,
      //   ).withAlpha(128),
      //   width: 1,
      // ),
      borderRadius: BorderRadius.circular(12.r),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/verification1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: screenHeight,
          ),

          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    children: [
                      Text(
                        'OTP Verification Code',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFFB4958),
                        ),
                      ),
                      SizedBox(height: 50.h),

                      Center(
                        child: Text(
                          'Code has been sent to ${widget.email}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Pinput(
                          closeKeyboardWhenCompleted: true,
                          controller: _otpController,
                          length: 4,
                          defaultPinTheme: defaultPinTheme,
                          onCompleted: (pin) {
                            if (kDebugMode) {
                              log('OTP entered: $pin');
                            }
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      CustomButton(
                        width: screenWidth * 0.9,
                        height: 40.h,
                        borderRadius: 10.r,
                        backgroundColor: Color(0xFFFB4958),
                        text: 'Verification',
                        onPressed: () {
                          Get.to(() => ForgetPasswordScreen());
                          Get.snackbar(
                            'Congratulations!',
                            'Please setup new password!',
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                        },
                      ),

                      // ElevatedButton(

                      //   onPressed: () async {
                      //     // Commented out validation and API call
                      //     /*
                      // await controller.verifyOTP(
                      //   email: widget.email ?? '',
                      //   otp: _otpController.text,
                      //   isForSignUp: widget.isForSignUp,
                      // );

                      // if (widget.isForSignUp) {
                      //   Get.to(() => SubscriptionPlanScreen());
                      // } else {
                      //   Get.to(() => ResetPasswordScreen(email: widget.email ?? ''));
                      // }
                      // */
                      //     if (kDebugMode) {
                      //       log(
                      //         'Verification button pressed with OTP: ${_otpController.text}',
                      //       );
                      //     }
                      //   },
                      //   style: ElevatedButton.styleFrom(

                      //     backgroundColor: const Color(0xFFFB4958),
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: 50,
                      //       vertical: 15,
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10.r),
                      //     ),
                      //   ),
                      //   child: Text(
                      //     'Verification',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      SizedBox(height: 30.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Didn’t get the otp',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 3.w),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Text(
                                'Resend',
                                style: TextStyle(
                                  color: Color(0xFFFB4958),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Positioned(
                                bottom: -2,
                                child: Container(
                                  width: 45,
                                  height: 1.5,
                                  color: Color(0xFFFB4958),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // GestureDetector(
                      //   onTap: () {},
                      //   // email == null
                      //   //     ? null
                      //   //     : () => controller.resendOTP(email!),
                      //   child: RichText(
                      //     text: TextSpan(
                      //       text: 'Didn\'t receive the code? ',
                      //       style: TextStyle(
                      //         fontSize: 14.sp,
                      //         color: const Color(0xFFFFFFFF),
                      //       ),
                      //       children: [
                      //         TextSpan(
                      //           text: 'Resend',
                      //           style: TextStyle(
                      //             fontSize: 14.sp,
                      //             color: const Color(0xFFFB4958),
                      //             fontWeight: FontWeight.bold,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
