import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:omega_web_inv/Auth_Screen/screens/otp_very_screen.dart';
import 'package:omega_web_inv/core/repository/network_caller/endpoints.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  // Send OTP to the email
  void sendemail() async {
    if (emailController.text.isNotEmpty) {
      try {
        EasyLoading.show(status: "Processing...");
        final response = await http.post(
          Uri.parse('${Urls.baseUrl}/auth/forgot-password'),
          body: {'email': emailController.text},
        );

        if (kDebugMode) {
          print(response.body);
        }
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          if (data['success'] == true) {
            Get.snackbar("Success", "Email sent successfully");
            Get.to(() => OTPVerificationScreen());
          } else {
            Get.snackbar("Error", "Something went wrong");
          }
        } else {
          if (kDebugMode) {
            print('Request failed with status: ${response.statusCode}');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error: $e');
        }
      } finally {
        EasyLoading.dismiss();
      }
    } else {
      Get.snackbar("Error", "Please enter email");
    }
  }
}
