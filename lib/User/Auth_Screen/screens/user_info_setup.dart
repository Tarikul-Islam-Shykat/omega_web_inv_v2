import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth_Screen/controller/custom_dropdown_controller.dart';
import 'package:omega_web_inv/User/Auth_Screen/controller/user_info_setup_controller.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Bottom_Nav_Bar/screen/custom_bottom_navbar.dart';

import 'package:omega_web_inv/core/global_widegts/custom_dropdown_button.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';

class UserInfoSetup extends StatelessWidget {
  final UserInfoSetupController controller = Get.put(UserInfoSetupController());
  final CustomDropDownController genderController = Get.put(
    CustomDropDownController(),
    tag: 'gender',
  );
  final CustomDropDownController fitnessGoalController = Get.put(
    CustomDropDownController(),
    tag: 'fitnessGoal',
  );

  UserInfoSetup({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/user_info.png',
                  fit: BoxFit.cover,
                  width: screenWidth,
                  height: screenHeight,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'User Info Setup',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFB4958),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    GestureDetector(
                      onTap: () async {
                        await controller.pickImage();
                      },
                      child: Obx(
                        () => Stack(
                          children: [
                            Container(
                              height: 70.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child:
                                    controller.selectedImage.value != null
                                        ? Image.file(
                                          controller.selectedImage.value!,
                                          fit: BoxFit.cover,
                                        )
                                        : Image.asset(
                                          'assets/images/user.png',
                                          fit: BoxFit.cover,
                                        ),
                              ),
                            ),

                            Positioned(
                              bottom: -2.h,
                              left: 50.w,
                              right: -1.w,
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFFFFFFFF),
                                child: Image.asset(
                                  'assets/images/camera.png',
                                  height: 20.h,
                                  width: 20.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    CustomTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Name',
                      textEditingController: controller.nameController,
                      fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Age',
                      textEditingController: controller.ageController,
                      fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomDropDown(
                        width: screenWidth * 0.9,
                        hintText: 'Gender',
                        value:
                            controller.selectedGender.value.isEmpty
                                ? null
                                : controller.selectedGender.value,
                        items: ['Male', 'Female'],
                        fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                        controller: genderController,
                        onChanged: controller.setGender,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Weight',
                      textEditingController: controller.weightController,
                      fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Height',
                      textEditingController: controller.heightController,
                      fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                    ),
                    SizedBox(height: 10.h),
                    Obx(
                      () => CustomDropDown(
                        width: screenWidth * 0.9,
                        hintText: 'Fitness Goal',
                        value:
                            controller.selectedFitnessGoal.value.isEmpty
                                ? null
                                : controller.selectedFitnessGoal.value,
                        items: [
                          'Lose Weight',
                          'Gain Muscle',
                          'Stay Healthy',
                          'Other',
                        ],
                        fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                        controller: fitnessGoalController,
                        onChanged: controller.setFitnessGoal,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      width: screenWidth * 0.9,
                      hintText: 'Dietary Preference',
                      textEditingController:
                          controller.dietaryPreferenceController,
                      fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                    ),
                    SizedBox(height: 30.h),
                    Obx(
                      () =>
                          controller.isLoading.value
                              ? Center(
                                child: SpinKitWave(
                                  color: const Color(0xFFFB4958),
                                  size: 30.sp,
                                ),
                              )
                              : SizedBox(
                                width: screenWidth * 0.9,
                                height: 40.h,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await controller.saveProfile();

                                    final bottomNavController = Get.put(
                                      BottomNavController(),
                                    );
                                    bottomNavController.changeIndex(
                                      0,
                                    ); // Ensure it's Home

                                    // Navigate to bottom nav bar with stack layout
                                    Get.to(() => BottomNavBarScreen());

                                    Get.snackbar(
                                      'Splendid!',
                                      'Profile Set Up Successfully!',
                                      icon: const Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                      backgroundColor: Colors.green,
                                      colorText: Colors.white,
                                      snackPosition: SnackPosition.TOP,
                                    );
                                  },

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFB4958),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
