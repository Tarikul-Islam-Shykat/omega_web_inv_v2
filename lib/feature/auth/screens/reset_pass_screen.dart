import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/const/app_loader.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';
import 'package:omega_web_inv/feature/Auth/screens/utils/show_success_dialog.dart';
import '../../../route/route.dart';
import '../controller/reset_pass_controller.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final ResetPasswordController controller = Get.put(ResetPasswordController());
   final String? email = Get.arguments['email']??'';

  void _submit(BuildContext context) {
       showSuccessDialog(
      buttonText: 'Continue',
      context: context,
      title: 'Success',
      message: 'Your Validation was successful!',
      image: Image.asset('assets/images/tick.png', height: 70.h, width: 70.w),
      onDonePressed: () {
        Get.offNamed(AppRoute.loginScreen);
        Get.snackbar(
          backgroundColor: Colors.green,
          colorText: Colors.white,
          'Successful!',
          'New Password Setup Successfully! Please Log In',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EBF0),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/forget_password.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.h),
                Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFFB4958),
                  ),
                ),
                SizedBox(height: 60.h),

                // New Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Text(
                      '  New Password',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(() {
                  return CustomTextField(
                    textEditingController:controller.newPassTEC.value,
                    hintText: '*********',
                    obscureText: !controller.isShowPassword.value,
                    fillColor: const Color(0xFFFFFFFF).withAlpha(30),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isShowPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFF4A4F5E),
                      ),
                      onPressed:()=> controller.onShowingPassword(),
                    ),
                  );
                }),
                SizedBox(height: 20.h),

                // Confirm Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Text(
                      '  Confirm Password',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(() {
                  return CustomTextField(
                    textEditingController: controller.conPassTEC.value,
                    hintText: '*********',
                    obscureText: !controller.isShowPassword.value,
                    fillColor: const Color(0xFFFFFFFF).withAlpha(30),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isShowPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: const Color(0xFF4A4F5E),
                      ),
                      onPressed:()=> controller.onShowingPassword(),
                    ),
                  );
                }),
                SizedBox(height: 40.h),

                // Submit Button or Loader
                Obx(() {
                  return controller.isLoading.value
                      ? loader()
                      : CustomButton(
                        onPressed: (){
                          controller.resetPassword(email.toString());
                          _submit(context);
                        } ,
                        text: 'Save',
                        textColor: Colors.white,
                        backgroundColor: const Color(0xFFFB4958),
                        width: 0.9.sw,
                        borderRadius: 10.r,
                      );
                }),
                SizedBox(height: 40.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
