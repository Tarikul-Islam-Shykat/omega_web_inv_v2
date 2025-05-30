// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Home/controller/workout_plan_controller.dart';
import 'package:omega_web_inv/core/global_widegts/custom_app_bar.dart';

class WorkoutPlan extends StatelessWidget {
  final String calorieCount;

  WorkoutPlan({super.key, required this.calorieCount});

  final WorkoutPlanController controller = Get.put(WorkoutPlanController());

  final List<Map<String, String>> exerciseList = [
    {
      'time': '10 min',
      'kcal': '140',
      'imagePath': 'assets/images/workout1.png',
      'centerImagePath': 'assets/images/user.png',
      'exerciseId': 'exercise_1',
      'title': 'Barbell squat 10 Minutes (140)',
    },
    {
      'time': '5 min',
      'kcal': '210',
      'imagePath': 'assets/images/workout2.png',
      'centerImagePath': 'assets/images/user.png',
      'exerciseId': 'exercise_2',
      'title': 'Mountain Climbers 5 Minutes (210)',
    },
    {
      'time': '10 min',
      'kcal': '200',
      'imagePath': 'assets/images/workout1.png',
      'centerImagePath': 'assets/images/user.png',
      'exerciseId': 'exercise_3',
      'title': 'Pushups 10 reps (200)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    controller.initializeCalories(calorieCount);
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Workout Plans', centerTitle: true),
            SizedBox(height: 8.h),
            Obx(
              () => Container(
                height: 60.h,
                width: sw * 0.95,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF).withAlpha(18),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    '${controller.remainingCalories.value} Kcal',
                    style: TextStyle(
                      color: const Color(0xFFFB4958),
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            /// ListView.builder for exercise cards
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: exerciseList.length,
              itemBuilder: (context, index) {
                final exercise = exerciseList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: _exerciseCard(
                    time: exercise['time']!,
                    kcal: exercise['kcal']!,
                    imagePath: exercise['imagePath']!,
                    centerImagePath: exercise['centerImagePath']!,
                    exerciseId: exercise['exerciseId']!,
                    title: exercise['title']!,
                  ),
                );
              },
            ),

            SizedBox(height: 20.h),
            SizedBox(
              width: sw * 0.9,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  log("Trainer button pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFB4958),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text('Your Trainer', style: TextStyle(fontSize: 16.sp)),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _exerciseCard({
    required String time,
    required String kcal,
    required String imagePath,
    required String centerImagePath,
    required String exerciseId,
    required String title,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0xFFFFFFFF).withAlpha(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                children: [
                  Image.asset(
                    centerImagePath,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Suggest Library Title Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggest Exercise Library',
                    style: TextStyle(
                      color: const Color(0xFFF5838C),
                      fontSize: 12.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => log('See all tapped'),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            /// 2 Row Items
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: _libraryItem(
                      imagePath: imagePath,
                      time: time,
                      kcal: kcal,
                    ),
                  ),
                  Flexible(
                    child: _libraryItem(
                      imagePath: imagePath,
                      time: time,
                      kcal: kcal,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: 150.w,
                height: 40.h,
                child: ElevatedButton(
                  onPressed: () {
                    log("Complete for $exerciseId");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFD9D9D9),
                    foregroundColor: Color(0xFF636363),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text('Complete', style: TextStyle(fontSize: 16.sp)),
                ),
              ),
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _libraryItem({
    required String imagePath,
    required String time,
    required String kcal,
  }) {
    return Container(
      width: 135.w,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Color(0xFFFFFFFF).withAlpha(40),
              child: Image.asset(
                'assets/images/pause.png',
                width: 10.w,
                height: 10.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withAlpha(30),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Row(
                  children: [
                    Icon(Icons.timer, size: 14.sp, color: Colors.white),
                    SizedBox(width: 4.w),
                    Text(
                      time,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.local_fire_department,
                      size: 14.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      kcal,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
