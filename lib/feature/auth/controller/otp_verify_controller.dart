import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/repository/network_caller/network_config.dart';
import 'package:pinput/pinput.dart';
import '../../../core/global_widegts/app_snackbar.dart';
import '../../../core/repository/network_caller/endpoints.dart';
import '../../../route/route.dart';

class OTPVerifyController extends GetxController{
Rx<TextEditingController> otpController = TextEditingController().obs;
RxBool isLoading = false.obs;
final NetworkConfig _networkConfig = NetworkConfig();

  //verify otp
  Future<bool> verifyOtp(String email)async{

    try{
      isLoading.value = true;
      final Map<String, dynamic> requestBody = {
        "email":email.toString(),
        "otp":int.parse(otpController.value.text),
      };
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.POST,
        Urls.otpVerify,
        json.encode(requestBody),
        is_auth: false,
      );
      log("response body $response");
      if(response != null && response['success']== true){
        AppSnackbar.show(message: "${response['message']}", isSuccess: true);
        Get.offNamed(
            arguments: {
              'email':email.toString(),
            },
            AppRoute.resetPassScreen);
        return true;
      }else{
        AppSnackbar.show(message: "${response['message']}", isSuccess: false);
        return false;
      }

    }catch(e){
      AppSnackbar.show(message: "OTP Failed $e", isSuccess: false);
      return false;
    }finally{
      isLoading.value = false;
    }
  }


  //resend otp
  Future<bool> resendOtp(String email)async{

    try{
      isLoading.value = true;
      final Map<String, dynamic> requestBody = {
        "email":email.toString(),
      };
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.POST,
        Urls.resendOTP,
        json.encode(requestBody),
        is_auth: false,
      );
      log("response body $response");
      if(response != null && response['success']== true){
        AppSnackbar.show(message: "${response['message']}", isSuccess: true);
        return true;
      }else{
        AppSnackbar.show(message: "${response['message']}", isSuccess: false);
        return false;
      }

    }catch(e){
      AppSnackbar.show(message: "Resend OTP Failed $e", isSuccess: false);
      return false;
    }finally{
      isLoading.value = false;
    }
  }

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
}