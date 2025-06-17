import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  var isPasswordVisible = false.obs; // Password hidden by default
  var isLoginLoading = false.obs; // Loader for login button
  var isLoading = false.obs; // General loading (e.g., Google Sign-In, OTP)
  late SharedPreferences _prefs; // Cached SharedPreferences instance

  @override
  void onInit() {
    super.onInit();
    _initPrefs();
    _prefillEmail();
  }

  Future<void> _initPrefs() async {
    try {
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      if (kDebugMode) print('Error initializing SharedPreferences: $e');
    }
  }

  Future<void> _prefillEmail() async {
    try {
      String? email = _prefs.getString('user_email');
      if (email != null && email.isNotEmpty) {
        emailTEController.text = email;
        if (kDebugMode) print('Pre-filled email: $email');
      }
    } catch (e) {
      if (kDebugMode) print('Error pre-filling email: $e');
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> handleLogin() async {
    // Validate inputs
    if (emailTEController.text.isEmpty || passwordTEController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    if (!GetUtils.isEmail(emailTEController.text)) {
      Get.snackbar(
        'Error',
        'Please enter a valid email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    try {
      isLoginLoading.value = true;

      String? storedEmail = _prefs.getString('user_email');
      String? storedPassword = _prefs.getString('user_password');
      String? userType = _prefs.getString('user_type');

      if (kDebugMode) {
        print('Login attempt:');
        print('Entered Email: ${emailTEController.text}');
        print('Stored Email: $storedEmail');
        print('Entered Password: ${passwordTEController.text}');
        print('Stored Password: $storedPassword');
        print('User Type: $userType');
      }

      // Check credentials (replace with actual API call)
      if (storedEmail == null || storedEmail != emailTEController.text) {
        Get.snackbar(
          'Error',
          'Email not found. Please sign up.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        return;
      }

      if (storedPassword == null ||
          storedPassword != passwordTEController.text) {
        Get.snackbar(
          'Error',
          'Incorrect password.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        return;
      }

      if (userType == null || userType.isEmpty) {
        Get.snackbar(
          'Error',
          'User type not found. Please sign up again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
        return;
      }

      // Store login state
      await _prefs.setBool('isLogin', true);

      Get.snackbar(
        'Success',
        'Login successful',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );

      // Navigate to home screen
      // Get.offAll(() => HomeScreen());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      if (kDebugMode) print('Login error: $e');
    } finally {
      isLoginLoading.value = false;
    }
  }

  Future<void> verifyOTP({
    required String email,
    required String otp,
    required bool isForSignUp,
  }) async {
    try {
      isLoading.value = true;

      // Simulate API call (replace with your actual API)
      await Future.delayed(Duration(seconds: 1));
      if (otp != '1234') {
        // Mock validation
        throw Exception('Invalid OTP');
      }

      // Store login state if needed
      await _prefs.setBool('isLogin', true);
      await _prefs.setString('user_email', email);

      Get.snackbar(
        'Success',
        'OTP verified successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );

      // Navigate based on isForSignUp
      if (isForSignUp) {
        // Get.offAll(() => SubscriptionPlanScreen());
      } else {
        // Get.offAll(() => ResetPasswordScreen(email: email));
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'OTP verification failed: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      if (kDebugMode) print('OTP verification error: $e');
      rethrow; // Rethrow for OTPController to handle
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOTP(String email) async {
    try {
      isLoading.value = true;

      // Simulate API call (replace with your actual API)
      await Future.delayed(Duration(seconds: 1));

      Get.snackbar(
        'Success',
        'New OTP sent to $email',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to resend OTP: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      if (kDebugMode) print('Resend OTP error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> handleGoogleSignIn() async {
    try {
      isLoading.value = true;

      // Placeholder for Google Sign-In (implement with Firebase Auth if needed)
      await Future.delayed(Duration(seconds: 2));
      throw Exception('Google Sign-In not implemented');

      // Example Firebase Auth integration (uncomment if used):
      /*
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Google Sign-In cancelled');
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await _prefs.setBool('isLogin', true);
      await _prefs.setString('user_email', googleUser.email);
      Get.offAll(() => HomeScreen());
      */
    } catch (e) {
      Get.snackbar(
        'Error',
        'Google Sign-In not available yet',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      if (kDebugMode) print('Google Sign-In error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}
