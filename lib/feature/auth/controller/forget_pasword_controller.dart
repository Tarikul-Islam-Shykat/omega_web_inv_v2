import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/global_widegts/app_snackbar.dart';
import 'package:omega_web_inv/core/repository/network_caller/endpoints.dart';
import 'package:omega_web_inv/core/repository/network_caller/network_config.dart';
import 'package:omega_web_inv/route/route.dart';
import 'package:pinput/pinput.dart';

class ForgetPasswordController extends GetxController {
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;
  final RxBool isLoading = false.obs;
  final NetworkConfig _networkConfig = NetworkConfig();

  Future<bool> sendOtpToEmail()async{
    if(emailController.value.text.isEmpty){
      AppSnackbar.show(message: "Please Enter Email", isSuccess: false);
      return false;
    }
    try{
      isLoading.value = true;
      final Map<String, dynamic> requestBody = {
        "email": emailController.value.text.trim(),
      };
      log("email :$requestBody");
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.POST,
        Urls.forgotPass,
        json.encode(requestBody),
        is_auth: false,
      );

      log("response body :${response?.toString() ?? 'null'}");
      if(response != null && response['success']== true){
        AppSnackbar.show(message: "${response['message']}", isSuccess: true);
        Get.toNamed(
          arguments: {
            'email':emailController.value.text,
          },
            AppRoute.forgetOTPScreen);
        return true;
      }else{
        AppSnackbar.show(message: "${response['message']}", isSuccess: false);
        log("failed -----${response['message']}");
        return false;
      }
    }catch(e){
      AppSnackbar.show(message: "Failed To Send Opt$e", isSuccess: false);
      log("failed catch-----$e");
      return false;
    }finally{
      isLoading.value = false;
    }
  }







}
