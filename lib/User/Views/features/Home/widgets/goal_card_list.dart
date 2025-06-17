import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth/controller/user_info_setup_controller.dart';
import 'goal_card.dart';

class GoalCardsList extends StatelessWidget {
  final UserInfoSetupController controller =
      Get.find<UserInfoSetupController>();

  GoalCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h, // Fixed height for the list
      child: Obx(() {
        final goals = controller.getGoalData();
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: goals.length,
          itemBuilder: (context, index) {
            final goal = goals[index];
            return Padding(
              padding: EdgeInsets.only(right: 12.w), // Spacing between cards
              child: GoalCard(
                title: goal['title'],
                value: goal['value'],
                icon: goal['icon'],
              ),
            );
          },
        );
      }),
    );
  }
}
