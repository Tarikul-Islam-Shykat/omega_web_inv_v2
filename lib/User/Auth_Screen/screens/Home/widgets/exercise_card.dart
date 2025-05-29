import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/controller/workout_plan_controller.dart';

Widget _exerciseCard({
  required String time,
  required String kcal,
  required String imagePath,
  required String centerImagePath,
  String? exerciseId, // Made optional
}) {
  final controller = Get.find<WorkoutPlanController>();
  return GestureDetector(
    onTap:
        exerciseId != null
            ? () => controller.completeExercise(kcal, exerciseId)
            : null,
    child: Container(
      width: 220.w,
      height: 164.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
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
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.1),
                radius: 15.r,
                child: Image.asset(
                  centerImagePath,
                  width: 15.w,
                  height: 15.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
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
    ),
  );
}
