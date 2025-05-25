import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/Auth_Screen/screens/find_account_screen.dart';
import 'package:omega_web_inv/Auth_Screen/screens/sign_up_screen.dart';
import 'package:omega_web_inv/core/const/app_loader.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  // String? _emailValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   }
  //   String pattern = r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$';
  //   RegExp regExp = RegExp(pattern);
  //   if (!regExp.hasMatch(value)) {
  //     return 'Enter a valid email address';
  //   }
  //   return null;
  // }

  // String? _passwordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters';
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE9EBF0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/login.png', fit: BoxFit.cover),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFB4958),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),

                // Email
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '     Email',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  textEditingController: controller.emailTEController,
                  hintText: 'Email',
                  bacgroundColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                  fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                  // validator: _emailValidator,
                  width: screenWidth,
                ),
                SizedBox(height: 20.h),

                // Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '     Password',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(() {
                  return CustomTextField(
                    textEditingController: controller.passwordTEController,
                    hintText: '*********',
                    bacgroundColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                    fillColor: Color(0xFFFFFFFF).withValues(alpha: 0.18),
                    // validator: _passwordValidator,
                    obscureText: controller.isPasswordVisible.value,
                    width: screenWidth,
                    // suffixIcon: IconButton(
                    //   icon: Icon(
                    //     controller.isPasswordVisible.value
                    //         ? Icons.visibility_off
                    //         : Icons.visibility,
                    //     color: const Color(0xFF4A4F5E),
                    //   ),
                    //   onPressed: controller.togglePasswordVisibility,
                    // ),
                  );
                }),
                SizedBox(height: 10.h),

                // Links
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => FindAccountScreen());
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),

                // Login Button or Loader
                Obx(() {
                  return controller.isLoginLoading.value
                      ? loader()
                      : CustomButton(
                        onPressed: () {
                          // controller.loginUser();
                        },
                        text: 'Login',
                        textColor: Colors.white,
                        backgroundColor: const Color(0xFFFB4958),
                        width: screenWidth * 0.9,
                        borderRadius: 10,
                      );
                }),
                SizedBox(height: 40.h),

                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account yet? ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFFB4958),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
