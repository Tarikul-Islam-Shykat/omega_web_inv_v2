import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controller/fitness_name_controller.dart';
import '../controller/workout_controller.dart';

class FitnessFilterDropdown extends StatelessWidget {
  final fitnessController = Get.find<FitnessNameController>();
  final workoutController = Get.find<AllWorkoutController>();

  FitnessFilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!fitnessController.isDropdownOpen.value) return SizedBox();

      final options = fitnessController.fitnessNameModel.map((e) => e.title ?? '').toList();

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white24),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            children: List.generate(options.length, (index) {
              final option = options[index];
              final isSelected = fitnessController.selectedFitnessNames.contains(option);

              return GestureDetector(
                onTap: () {
                  fitnessController.toggleSelection(option);
                  workoutController.applyFilter(fitnessController.selectedFitnessNames);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (_) {
                          fitnessController.toggleSelection(option);
                          workoutController.applyFilter(fitnessController.selectedFitnessNames);
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.redAccent,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        option,
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
