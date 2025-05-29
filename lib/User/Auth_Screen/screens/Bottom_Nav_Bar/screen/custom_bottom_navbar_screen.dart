// custom_bottom_navbar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.find();

  final List<IconData> icons = [
    Icons.home,
    Icons.fitness_center,
    Icons.favorite,
    Icons.bar_chart,
    Icons.group,
  ];

  CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(icons.length, (index) {
              bool isSelected = controller.selectedIndex.value == index;
              return GestureDetector(
                onTap: () => controller.changeIndex(index),
                child: Container(
                  height: 50.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.redAccent : Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icons[index],
                    color: isSelected ? Colors.white : Colors.black54,
                    size: 28.sp,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
