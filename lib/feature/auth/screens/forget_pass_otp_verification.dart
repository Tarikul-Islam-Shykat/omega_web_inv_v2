import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omega_web_inv/core/const/app_loader.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import '../controller/forget_pasword_controller.dart';


class ForgetPassOtpVerification extends StatelessWidget {
   ForgetPassOtpVerification({super.key,});
   final ForgetPasswordController controller = Get.put(ForgetPasswordController());
   final String? email = Get.arguments['email']??"";


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
                          'Code has been sent to ${email.toString()}',
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
                          controller:controller.otpController.value,
                          length: 4,
                          defaultPinTheme: controller.defaultPinTheme,
                          onCompleted: (pin) {
                            if (kDebugMode) {
                              log('OTP entered: $pin');
                            }
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      Obx((){
                          return controller.isLoading.value?loader():CustomButton(
                            width: screenWidth * 0.9,
                            height: 40.h,
                            borderRadius: 10.r,
                            backgroundColor: Color(0xFFFB4958),
                            text: 'Verification',
                            onPressed: () {
                              controller.verifyOtp(email.toString());

                            },
                          );
                        }
                      ),

                      // ElevatedButton(
                      //
                      //   onPressed: () async {
                      //     // Commented out validation and API call
                      //     /*
                      // await controller.verifyOTP(
                      //   email: widget.email ?? '',
                      //   otp: _otpController.text,
                      //   isForSignUp: widget.isForSignUp,
                      // );
                      //
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
                      //
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

                          Obx(() => GestureDetector(
                            onTap: controller.isLoading.value
                                ? null
                                : () {
                              if (email != null && email!.isNotEmpty) {
                                controller.resendOtp(email.toString());
                              } else {
                                Get.snackbar("Error", "Email missing");
                              }
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Text(
                                  controller.isLoading.value ? "Sending..." : "Resend",
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
                          )),
                        ],
                      ),


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
