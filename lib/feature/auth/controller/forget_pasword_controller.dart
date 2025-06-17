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
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.POST,
        Urls.forgotPass,
          {
            "email":emailController.value.text,
          },
        is_auth: false,
      );
      if(response != null && response['success']== true){
        AppSnackbar.show(message: "${response['message']}", isSuccess: true);
        Get.toNamed(
          arguments: {
            'email':emailController.value.text,
          },
            AppRoute.otpVerifyScreen);
        return true;
      }else{
        AppSnackbar.show(message: "${response['message']}", isSuccess: false);
        return false;
      }
    }catch(e){
      AppSnackbar.show(message: "Failed To Send Opt$e", isSuccess: false);
      return false;
    }finally{
      isLoading.value = false;
    }
  }


  //verify otp
  Future<bool> verifyOtp(String email)async{
    
    try{
      isLoading.value = true;
      final response = await _networkConfig.ApiRequestHandler(
          RequestMethod.POST,
          Urls.otpVerify,
          {
            "email":email.toString(),
            "otp":otpController.value.text,
          },
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
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.POST,
        Urls.resendOTP,
        {
          "email":email.toString(),
        },
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
