import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth/controller/login_controller.dart';
import 'package:omega_web_inv/User/Auth/screens/success_screen.dart';

class OTPController extends GetxController {
  final RxString otp = ''.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final LoginController loginController = Get.find<LoginController>();

  void updateOTP(String value) {
    otp.value = value;
    errorMessage.value = ''; // Clear error on new input
  }

  Future<void> verifyOTP({
    required String email,
    required bool isForSignUp,
  }) async {
    if (otp.value.length != 4) {
      errorMessage.value = 'Please enter a 4-digit OTP';
      return;
    }

    isLoading.value = true;
    try {
      // Call the existing verifyOTP method from LoginController
      await loginController.verifyOTP(
        email: email,
        otp: otp.value,
        isForSignUp: isForSignUp,
      );

      // Navigate based on isForSignUp
      Get.to(() => SuccessScreen());
    } catch (e) {
      errorMessage.value = 'Invalid OTP or network error. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOTP(String email) async {
    isLoading.value = true;
    try {
      // Assuming LoginController has a resendOTP method
      await loginController.resendOTP(email);
      Get.snackbar(
        'Success',
        'OTP has been resent to $email',
        backgroundColor: Color(0xFFFB4958),
        colorText: Colors.white,
      );
    } catch (e) {
      errorMessage.value = 'Failed to resend OTP. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }
}
