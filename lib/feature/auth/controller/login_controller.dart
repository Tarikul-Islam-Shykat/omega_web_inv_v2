import 'dart:convert';
import 'dart:developer';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/core/global_widegts/app_snackbar.dart';
import 'package:prettyrini/core/network_caller/network_config.dart';
import 'package:prettyrini/core/services_class/local_service/local_services.dart';
import 'package:prettyrini/route/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/network_caller/endpoints.dart';

class LoginController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();
  final NetworkConfig _networkConfig = NetworkConfig();
  final isPasswordVisible = false.obs;
  final isLoading = false.obs;
  String? fcmToken;

  @override
  void onInit() {
    super.onInit();
    requestNotificationPermission();

  }

  // Request notification permissions
  Future<void> requestNotificationPermission() async {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;
    // NotificationSettings settings = await messaging.requestPermission(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    // );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   fcmToken = await messaging.getToken();
    //   if (kDebugMode) {
    //     print("FCM Token: $fcmToken");
    //   } // Debugging purpose
    // } else {
    //   if (kDebugMode) {
    //     print("User denied permission");
    //   }
    // }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  Future<bool> loginUser()async{
    if(emailTEController.text.isEmpty || passwordTEController.text.isEmpty){
      AppSnackbar.show(message: "Please fill all fields", isSuccess: false);
      return false;
    }
    try{
      isLoading.value = true;
      String email = emailTEController.text;
      String password = passwordTEController.text;
      final Map<String, dynamic> requestBody ={
        'email': email,
        'password':password,
      };
      log("Request body $requestBody");
      final response = await _networkConfig.ApiRequestHandler(RequestMethod.POST, Urls.login, jsonEncode(requestBody),is_auth: false);
      if(response['success']== false){
        AppSnackbar.show(message: response['message'], isSuccess: false);
        log("message false --- ${response['message']}");
      }
      if(response != null && response['success']==true){
        var localService = LocalService();
        await localService.setToken(response['data']['token']);
        final token = await localService.getToken();
        log("token ----- $token");
        //TODO: routing bad ase .....
        AppSnackbar.show(message: "Login Successful", isSuccess: true);
        return true;
      }else{
        AppSnackbar.show(message: "Login Failed", isSuccess: false);
        log("failed login --- ${response["message"]}");
        return false;
      }
    }catch(e){
      AppSnackbar.show(message: "Failed To Login$e ", isSuccess: false);
      return false;
    }finally{
      isLoading.value = false;
    }

  }

  // Future<void> handleLogin() async {
  //   if (emailTEController.text.isEmpty || passwordTEController.text.isEmpty) {
  //     Get.snackbar(
  //       'Error',
  //       'Please fill all fields',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }
  //
  //   try {
  //     isLoading.value = true;
  //     final response = await http.post(
  //       Uri.parse(Urls.login),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'email': emailTEController.text,
  //         'password': passwordTEController.text,
  //         'fcmToken': fcmToken ?? "",
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       final token = data['data']['token'];
  //       if (kDebugMode) {
  //         print("token1$token");
  //       }
  //       SharedPreferences pref = await SharedPreferences.getInstance();
  //       pref.setString("token", token);
  //       pref.setBool("isLogin", true);
  //       //Get.offAll(() => NavBarView());
  //       Get.snackbar(
  //         'Success',
  //         'Login successful',
  //         snackPosition: SnackPosition.TOP,
  //       );
  //     } else {
  //       Get.snackbar(
  //         'Error',
  //         'Login failed. Please try again.',
  //         snackPosition: SnackPosition.TOP,
  //       );
  //     }
  //   } catch (e) {
  //     Get.snackbar(
  //       'Error',
  //       'Something went wrong',
  //       snackPosition: SnackPosition.TOP,
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  Future<void> handleGoogleSignIn() async {
    try {
      isLoading.value = true;
      // Implement Google Sign In logic here
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      Get.snackbar(
        'Error',
        'Google sign in failed',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }




  @override
  void dispose() {
    super.dispose();
    emailTEController.dispose();
    passwordTEController.dispose();
  }
}
