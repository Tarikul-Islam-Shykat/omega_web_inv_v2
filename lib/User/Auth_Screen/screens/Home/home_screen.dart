// home_content.dart
// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/controller/goal_controller.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/meal_plan.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/widgets/exercise_library.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/widgets/goal_card.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/widgets/user_profile_header.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/workout_plan.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Nutrition/nutrition_page.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Workouts/workout_page.dart';

class HomeContent extends StatelessWidget {
  HomeContent({super.key});

  final controller = Get.put(GoalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 20.h,
            bottom: 120.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              UserProfileHeader(),
              SizedBox(height: 24.h),

              // Date
              Text(
                "Friday, May 3",
                style: TextStyle(color: Color(0xFFF5838C), fontSize: 14.sp),
              ),
              SizedBox(height: 12.h),

              // Goals
              Row(
                children: [
                  Obx(
                    () => GoalCard(
                      title: 'Today Goals',
                      value: Get.find<GoalController>().todayGoals.value,
                      icon: Icons.check,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () => Get.to(() => WorkoutPage()),
                    child: Obx(
                      () => GoalCard(
                        title: 'Calories Burned',
                        value: Get.find<GoalController>().caloriesBurned.value,
                        icon: Icons.local_fire_department,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () => Get.to(() => NutritionPage()),
                    child: Obx(
                      () => GoalCard(
                        title: 'Calories Eaten',
                        value: Get.find<GoalController>().caloriesEaten.value,
                        icon: Icons.fastfood,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Exercise Library
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Exercise Library",
                    style: TextStyle(
                      color: Color(0xFFF5838C),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ExerciseLibrary());
                    },
                    child: Row(
                      children: [
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 120.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _exerciseCard(
                      "5 Minutes",
                      "220 Kcal",
                      "assets/images/workout1.png",
                      "assets/images/pause.png",
                    ),
                    SizedBox(width: 12.w),
                    _exerciseCard(
                      "5 Minutes",
                      "210 Kcal",
                      "assets/images/workout2.png",
                      "assets/images/pause.png",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Workout Plans
              _sectionCard(
                title: "Workout Plans (550)",
                items: [
                  "Barbell squat 10 Minutes",
                  "Mountain Climbers 5 Minutes",
                  "Pushups 10 reps",
                ],
                icons: [
                  "assets/images/user.png",
                  "assets/images/user.png",
                  "assets/images/user.png",
                ],
              ),

              SizedBox(height: 16.h),

              // Meal Plans
              _sectionCard(
                title: "Meal Plans (1200)",
                items: [
                  "Oats + Banana (Breakfast)",
                  "Rice, Grilled, Veggies (Lunch)",
                  "Salad + Soup (Dinner)",
                ],
                icons: [
                  "assets/images/user.png",
                  "assets/images/user.png",
                  "assets/images/user.png",
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _exerciseCard(
    String time,
    String kcal,
    String imagePath,
    String centerImagePath,
  ) {
    return Container(
      width: 220.w,
      height: 164.h,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFFFFFF)),
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
          // Centered photo
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF).withAlpha(40),
                child: Image.asset(
                  centerImagePath,
                  width: 15.w,
                  height: 15.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Bottom content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withAlpha(30),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer, size: 14.sp, color: Colors.white),
                      SizedBox(width: 4.w),
                      Text(
                        time,
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.local_fire_department,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        kcal,
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required String title,
    required List<String> items,
    required List<String> icons,
  }) {
    String calorieCount = '';
    final RegExp regex = RegExp(r'\((\d+)\)');
    final match = regex.firstMatch(title);
    if (match != null) {
      calorieCount = match.group(1) ?? '';
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title.replaceAll('($calorieCount)', '').trim(),
                style: TextStyle(
                  color: Color(0xFFF5838C),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              // Display the calorie count separately
              Text(
                calorieCount.isNotEmpty ? '($calorieCount)' : '',
                style: TextStyle(
                  color: Color(0xFFF5838C),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (title.contains("Workout Plans")) {
                    Get.to(() => WorkoutPlan(calorieCount: calorieCount));
                    log(
                      'Navigating to WorkoutPlan with calories: $calorieCount',
                    );
                  } else if (title.contains("Meal Plans")) {
                    Get.to(() => MealPlan(calorieCount: calorieCount));
                    log('Navigating to MealPlan with calories: $calorieCount');
                  }
                },
                child: CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Color(0xFFFB4958),
                  child: Transform.rotate(
                    angle: 1.57 / 2,
                    child: Icon(
                      Icons.arrow_upward_rounded,
                      size: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...List.generate(items.length, (index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Row(
                children: [
                  Image.asset(icons[index], width: 40.w, height: 40.h),
                  SizedBox(width: 10.w),
                  Text(
                    items[index],
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
