import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_web_inv/core/global_widegts/checkbox_dropdown_button.dart';
import 'package:omega_web_inv/core/global_widegts/common_dropdown.dart';
import 'package:omega_web_inv/core/global_widegts/custom_text_field.dart';
import '../../../../core/const/app_colors.dart';
import '../../home/controller/custom_dropdown_controller.dart';
import '../controller/user_info_setup_controller.dart';

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
                      'user Info Setup',
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
                                child: controller.profileImage.value != null
                                    ? Image.file(
                                  controller.profileImage.value!,
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
                              child: InkWell(
                                 onTap: (){
                                   _showImagePickerOptions(context);
                                 },
                                child: CircleAvatar(
                                  backgroundColor: Colors.white54,
                                  child: Image.asset(
                                    'assets/images/camera.png',
                                    height: 20.h,
                                    width: 20.w,
                                  ),
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
                    CommonDropdown(
                        items: controller.gender.toSet().toList(),
                        selectedItem: controller.selectedGender.value.trim().isEmpty
                                ? null
                                : controller.selectedGender.value.trim(),
                        label: "Gender",
                        width: screenWidth * 0.9,
                        fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                          onChanged: (value) {
                                  if (value != null) {
                                    controller.onSetGender(value);
                                  }
                                },
                    ),
                    //gender
                    // Obx(() {
                    //     return CustomDropDown(
                    //       width: screenWidth * 0.9,
                    //       hintText: 'Gender',
                    //       value: controller.selectedGender.value.trim().isEmpty
                    //           ? null
                    //           : controller.selectedGender.value.trim(),
                    //       items: controller.gender.toSet().toList(), // remove duplicates
                    //       fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                    //       controller: controller.dropdownController,
                    //       onChanged: (value) {
                    //         if (value != null) {
                    //           controller.onSetGender(value);
                    //         }
                    //       },
                    //     );
                    //   }
                    // ),


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

                    //Fitness
                    Obx((){
                        return CheckBoxDropDown(
                          width: screenWidth * 0.9,
                          hintText: 'Fitness',
                          value: controller.selectedFitnessGoal.value.trim().isEmpty
                              ? null
                              : controller.selectedFitnessGoal.value.trim(),
                          items: controller.fitnessGoal.toSet().toList(), // remove duplicates
                          fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                          controller: controller.dropdownController,
                          onChanged: (value) {
                            if (value != null) {
                              controller.onSetFitnessGoal(value);
                            }
                          },
                        );
                      }),

                    // Obx(
                    //   () => CustomDropDown(
                    //     width: screenWidth * 0.9,
                    //     hintText: 'Fitness Goal',
                    //     value:
                    //     controller.selectedFitnessGoal.value.isEmpty
                    //             ? null
                    //             : controller.selectedFitnessGoal.value,
                    //     items: [
                    //       'Lose Weight',
                    //       'Gain Muscle',
                    //       'Stay Healthy',
                    //       'Other',
                    //     ],
                    //     fillColor: const Color(0xFFFFFFFF).withAlpha(18),
                    //     controller: fitnessGoalController,
                    //     onChanged: controller.setFitnessGoal,
                    //   ),
                    // ),
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
                          controller.isUploading.value
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
                                    controller.uploadProfilePicture();
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

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Select Profile Picture',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageOption(
                  context,
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: () {
                    Get.back();
                    controller.pickProfileImageFromCamera();
                  },
                ),
                _buildImageOption(
                  context,
                  icon: Icons.photo_library,
                  label: 'Gallery',
                  onTap: () {
                    Get.back();
                    controller.pickProfileImage();
                  },
                ),
              ],
            ),
            if (controller.profileImage.value != null) ...[
              SizedBox(height: 20.h),
              _buildImageOption(
                context,
                icon: Icons.delete,
                label: 'Remove',
                color: Colors.red,
                onTap: () {
                  Get.back();
                  // controller.clearImage();
                },
              ),
            ],
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildImageOption(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
        Color? color,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: (color ?? AppColors.primaryColor).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: (color ?? AppColors.primaryColor).withOpacity(0.3),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30.sp,
              color: color ?? AppColors.primaryColor,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: color ?? AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
