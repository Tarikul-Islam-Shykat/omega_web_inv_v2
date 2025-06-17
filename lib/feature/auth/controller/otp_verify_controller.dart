import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:prettyrini/core/global_widegts/app_snackbar.dart';
import 'package:prettyrini/core/network_caller/network_config.dart';
import 'package:prettyrini/route/route.dart';
import '../../../core/network_caller/endpoints.dart';

class OtpVerifyController extends GetxController {
  final NetworkConfig _networkConfig = NetworkConfig();

  var isOTPSignUpLoading = false.obs;
  Future<bool> sendOTP(String email, int otp) async {
    try {
      isOTPSignUpLoading.value = true;
      final Map<String, dynamic> requestBody = {
        "email": email,
        "otp": otp,
      };
      log(requestBody.toString());
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.POST,
        Urls.verifyOTP,
        json.encode(requestBody),
        is_auth: false,
      );
      log("registerUser $response ${response['data']}");
      if (response['success'] == false) {
        AppSnackbar.show(message: response['message'], isSuccess: false);
      }
      if (response != null && response['success'] == true) {
        AppSnackbar.show(
            message: "OTP Verification Successful", isSuccess: true);
        Get.toNamed(AppRoute.loginScreen);
        return true;
      } else {
        AppSnackbar.show(message: "Failed To Registration", isSuccess: false);
        return false;
      }
    } catch (e) {
      AppSnackbar.show(message: "Failed Apply Code", isSuccess: false);
      return false;
    } finally {
      isOTPSignUpLoading.value = false;
    }
  }
}