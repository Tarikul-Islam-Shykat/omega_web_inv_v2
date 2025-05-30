import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:omega_web_inv/core/repository/network_caller/endpoints.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final RxBool isLoginLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  // Toggle password visibility
  // void togglePasswordVisibility() {
  //   isPasswordVisible.value = !isPasswordVisible.value;
  // }

  // void toggleConfirmPasswordVisibility() {
  //   isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  // }

  // Send new password to reset
  void resetPassword() async {
    try {
      EasyLoading.show(status: "Processing...");
      // Assuming the API requires an email or OTP token; adjust as needed
      final response = await http.post(
        Uri.parse('${Urls.baseUrl}/auth/reset-password'), // Adjust endpoint
        body: {
          'password': passwordController.text,
          'confirm_password': confirmPasswordController.text,
          // Add 'email' or 'token' if required by API, e.g., from Get.arguments
        },
      );

      if (kDebugMode) {
        print(response.body);
      }
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['success'] == true) {
          Get.snackbar("Success", "Password reset successfully");
          Get.offAllNamed('/login'); // Navigate to login or another screen
        } else {
          Get.snackbar("Error", data['message'] ?? "Something went wrong");
        }
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}');
        }
        Get.snackbar("Error", "Failed to reset password");
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      Get.snackbar("Error", "An error occurred");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
