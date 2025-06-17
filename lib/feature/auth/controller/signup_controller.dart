import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/network_caller/network_config.dart';
import '../../../core/global_widegts/app_snackbar.dart';
import '../../../core/network_caller/endpoints.dart';

class SignInController extends GetxController {
  Rx<TextEditingController>  emailTEController = TextEditingController().obs;
  Rx<TextEditingController>  phoneTEController = TextEditingController().obs;
  Rx<TextEditingController>  passwordTEController = TextEditingController().obs;
  final NetworkConfig _networkConfig = NetworkConfig();
  final isPasswordVisible = false.obs;
  final isRegisterLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<bool> registerUser() async {
    if (emailTEController.value.text.isEmpty ||
        passwordTEController.value.text.isEmpty ||
        phoneTEController.value.text.isEmpty) {
      AppSnackbar.show(message: 'Please fill all fields', isSuccess: false);
      return false;
    }

    try {
      isRegisterLoading.value = true;
      String email = emailTEController.value.text;
      String password = passwordTEController.value.text;
      String phone = phoneTEController.value.text;

      final Map<String, dynamic> requestBody = {
        "email": email,
        "phone": phone,
        "birth": "",
        "password": password,
      };
      log(requestBody.toString());
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.POST,
        Urls.signUp,
        json.encode(requestBody),
        is_auth: false,
      );
      log("registerUser $response ${response['data']}");
      if (response['success'] == false) {
        AppSnackbar.show(message: response['message'], isSuccess: false);
      }
      if (response != null && response['success'] == true) {
        AppSnackbar.show(message: "Registration Successful", isSuccess: true);
        log("signUp success --${response['data']}");
        // Get.toNamed(
        //   //AppRoute.getOtpVerificationScreen(),
        //   //arguments: {'email': email.trim()},
        // );
        return true;
      } else {
        AppSnackbar.show(message: "Failed To Registration", isSuccess: false);
        log("sign up failed --- ${response['data']}");

        return false;
      }
    } catch (e) {
      AppSnackbar.show(message: "Failed To Registration", isSuccess: false);
      log("failed signUp --$e");
      return false;
    } finally {
      isRegisterLoading.value = false;
    }
  }

}
