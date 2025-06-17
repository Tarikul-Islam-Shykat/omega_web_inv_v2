// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth/screens/reset_pasword_screen.dart';
import 'package:pinput/pinput.dart';

class EmailVarification extends StatefulWidget {
  final String email;

  const EmailVarification({super.key, required this.email});

  @override
  _EmailVarificationState createState() => _EmailVarificationState();
}

class _EmailVarificationState extends State<EmailVarification> {
  final _otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(fontSize: 22, color: Color(0xFF4A4F5E)),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xFF4A4F5E), width: 1),
      borderRadius: BorderRadius.circular(12),
    ),
  );

  // // Function to handle OTP submission
  // void _verifyOTP() {
  //   String otp = _otpController.text;

  //   if (otp.length == 4) {
  //     // Simulate OTP verification (you can integrate real verification logic here)
  //     print('OTP entered: $otp');

  //     // Show Success Screen in a dialog
  //     showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           content: Container(
  //             padding: EdgeInsets.all(20),
  //             width: double.maxFinite,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 // Success Icon
  //                 // CircleAvatar(
  //                 //   radius: 30,
  //                 //   backgroundColor: Color(0xFFE9EBF0),
  //                 //   child: Icon(Icons.check, color: Color(0xFF1F3892), size: 40),
  //                 // ),
  //                 Image.asset(
  //                   'assets/images/tick.png',
  //                   height: 60.h,
  //                   width: 60.w,
  //                 ),
  //                 SizedBox(height: 20.h),

  //                 // Success Text
  //                 Text(
  //                   'Success',
  //                   style: TextStyle(
  //                     fontSize: 20.sp,
  //                     fontWeight: FontWeight.bold,
  //                     color: Color(0xFF000000),
  //                   ),
  //                 ),
  //                 SizedBox(height: 10.h),
  //                 Text(
  //                   'Your verification was successful!',
  //                   style: TextStyle(fontSize: 16.sp, color: Color(0xFF4A4F5E)),
  //                   textAlign: TextAlign.center,
  //                 ),
  //                 SizedBox(height: 20.h),

  //                 // Continue Button
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Get.back();
  //                     Get.to(LoginScreen());
  //                   },
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Color(0xFF1F3892),
  //                     padding: EdgeInsets.symmetric(
  //                       horizontal: 60,
  //                       vertical: 15,
  //                     ),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(30),
  //                     ),
  //                   ),
  //                   child: Text(
  //                     'Continue',
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   } else {
  //     // Show error if OTP is not valid
  //     Get.snackbar(
  //       'Error',
  //       'Please enter a valid 4-digit OTP.',
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFE9EBF0),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Text(
                    'Email Verification',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F3892),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Display the email where OTP was sent
                  Center(
                    child: Text(
                      'Code has been sent to ${widget.email}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Color(0xFF4A4F5E),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // OTP input using Pinput
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Pinput(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      controller: _otpController,
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      onCompleted: (pin) {
                        if (kDebugMode) {
                          print('OTP entered: $pin');
                        }
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  ElevatedButton(
                    onPressed: () {
                      Get.to(() =>ResetPasswordScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F3892),
                      padding: EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Verification',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Resend OTP link
                  GestureDetector(
                    onTap: () {
                      if (kDebugMode) {
                        print('OTP Resent');
                      }
                    },
                    child: Text(
                      'Didn’t get the otp? Resend',
                      style: TextStyle(
                        color: Color(0xFF1F3892),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
