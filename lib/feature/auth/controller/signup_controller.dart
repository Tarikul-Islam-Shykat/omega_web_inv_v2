// import 'dart:convert';
// import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final dobController = TextEditingController();
  final referralCodeController = TextEditingController();
  final addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  var selectedImage = Rx<File?>(null);
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;
  var termsAccepted = false.obs;
  var privacyAccepted = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  /// Password validation: Must contain uppercase, number, and special character
  // String? validateStrongPassword(String? password) {
  //   if (password == null || password.isEmpty) {
  //     return 'Password is required';
  //   }

  //   if (password.length < 8) {
  //     return 'Password must be at least 8 characters';
  //   }

  //   final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  //   final hasLowercase = password.contains(RegExp(r'[a-z]'));
  //   final hasSpecialChar = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  //   if (!hasUppercase) {
  //     return 'Must contain at least one uppercase letter';
  //   }

  //   if (!hasLowercase) {
  //     return 'Must contain at least one lowercase letter';
  //   }

  //   if (!hasSpecialChar) {
  //     return 'Must contain at least one special character';
  //   }

  //   return null;
  // }

  // Future<void> registerUser() async {
  //   if (!formKey.currentState!.validate() ||
  //       !termsAccepted.value ||
  //       !privacyAccepted.value) {
  //     Get.snackbar(
  //       'Error',
  //       'Please accept Terms & Conditions and Privacy Policy',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //     return;
  //   }

  //   isLoading.value = true;

  //   try {
  //     final formattedDob = DateTime.parse(dobController.text).toIso8601String();

  //     final userData = {
  //       "fullName": nameController.text.trim(),
  //       "email": emailController.text.trim(),
  //       "phoneNumber": phoneController.text.trim(),
  //       "dob": "${formattedDob}Z",
  //       "password": passwordController.text.trim(),
  //       "loginType":
  //           Get.put(UserOnController()).selectedRole.value.toUpperCase(),
  //       "referralCode": referralCodeController.text.trim(),
  //       "termsAccepted": true,
  //       "privacyAccepted": true,
  //       "address": addressController.text.trim(),
  //     };

  //     final uri = Uri.parse(
  //       "https://evriman-backend.vercel.app/api/v1/users/register",
  //     );

  //     http.Response response;

  //     if (selectedImage.value != null) {
  //       // Multipart request if image is provided
  //       final request = http.MultipartRequest('POST', uri);
  //       request.fields['data'] = jsonEncode(userData);
  //       request.files.add(
  //         await http.MultipartFile.fromPath('image', selectedImage.value!.path),
  //       );

  //       final streamedResponse = await request.send();
  //       final responseBody = await streamedResponse.stream.bytesToString();
  //       response = http.Response(responseBody, streamedResponse.statusCode);
  //     } else {
  //       // Regular JSON POST
  //       response = await http.post(
  //         uri,
  //         headers: {"Content-Type": "application/json"},
  //         body: jsonEncode(userData),
  //       );
  //     }

  //     isLoading.value = false;

  //     final decoded = jsonDecode(response.body);
  //     log("Status Code: ${response.statusCode}");
  //     log("Response: ${response.body}");

  //     if (response.statusCode == 200) {
  //       if (decoded['success'] == true) {
  //         final result = decoded['data']['result'];
  //         final token = decoded['data']['token'];

  //         final prefs = await SharedPreferences.getInstance();
  //         await prefs.setString('token', token);
  //         await prefs.setString('userId', result['userId'].toString());
  //         await prefs.setString('email', result['email']);
  //         await prefs.setString('name', result['fullName']);
  //         await prefs.setString('role', result['role']);

  //         Get.snackbar(
  //           'Success',
  //           decoded['message'] ?? 'Registration successful',
  //           backgroundColor: Colors.green,
  //           colorText: Colors.white,
  //         );
  //         log("Success: ${emailController.text}");

  //         Get.to(
  //           () => OTPVerificationScreen(
  //             email: emailController.text,
  //             isForSignUp: true,
  //           ),
  //         );
  //       } else if (response.statusCode == 400) {
  //         Get.snackbar(
  //           'Error',
  //           decoded['message'] ?? 'Registration failed',
  //           backgroundColor: Colors.red,
  //           colorText: Colors.white,
  //         );
  //       }
  //     } else if (response.statusCode == 400) {
  //       Get.snackbar(
  //         'Error',
  //         decoded['message'] ?? 'Server error: ${response.statusCode}',
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //   } catch (e) {
  //     isLoading.value = false;
  //     log('Exception: $e');
  //     Get.snackbar(
  //       'Error',
  //       'Something went wrong: $e',
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }
  // }



  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dobController.dispose();
    referralCodeController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
