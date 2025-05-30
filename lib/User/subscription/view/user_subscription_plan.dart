// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/subscription/controller/user_subscription_controller.dart';
import 'package:omega_web_inv/User/Auth/screens/user_info_setup.dart';
import 'package:omega_web_inv/core/global_widegts/custom_app_bar.dart';

class SubscriptionPlan extends StatelessWidget {
  final controller = Get.put(SubscriptionController());

  final RxList<Map<String, dynamic>> plans =
      [
        {
          "title": "Freemium Tier (Free Plan)",
          "details":
              "* Limited workouts (3–5)\n* Basic nutrition tracking\n* Daily steps + hydration tracking\n* Supplement reminders\n* Community access (basic)",
          "button": "Go Free Plan",
          "price": "",
          "highlight": false,
        },
        {
          "title": "Premium Tier",
          "details":
              "* Full workout library\n* AI personalized plans\n* Advanced nutrition tracking\n* Health app integrations + links\n* Priority support\n* Supplement recommendations",
          "button": "Go Premium",
          "price": "\$9.99/month or \$79.99/year",
          "highlight": false,
        },
        {
          "title": "Supplement Add-On Plan",
          "details":
              "* 25% off all supplements\n* Exclusive supplement bundles\n* Early access to new products\n* VIP-only supplement content",
          "button": "Add Supplement Plan",
          "price": "\$19.99/month",
          "highlight": false,
        },
      ].obs;

  SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Image.asset('assets/images/subscription.png'),
          Obx(
            () => ListView(
              padding: EdgeInsets.all(16.w),
              children: [
                CustomAppBar(
                  title: 'Subscription Plan',
                  centerTitle: true,
                  showBackButton: false,
                  onTap: () => Get.back(),
                ),
                SizedBox(height: 16.h),
                ...plans.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> plan = entry.value;
                  final isSelected = controller.selectedIndex.value == index;
                  return _buildPlanCard(context, plan, index, isSelected);
                }),
                SizedBox(height: 16.h),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          log('Clicked');
                        },
                        child: Text(
                          'Click here',
                          style: TextStyle(
                            color: Color(0xFFFB4958),
                            fontSize: 12.sp,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        textAlign: TextAlign.center,
                        'to use your supplement add-on benefits.',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanCard(
    BuildContext context,
    Map<String, dynamic> plan,
    int index,
    bool isSelected,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Determine background color based on index
    final bgColor =
        index == 0 || index == 2
            ? const Color(0xFFFFFFFF).withAlpha(18)
            : const Color(0xFF351316).withOpacity(0.65);
    final textColor = const Color(0xFFF5838C);
    final crownImage = 'assets/images/logos.png';

    return GestureDetector(
      onTap: () => controller.selectPlan(index),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFFB4958) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(crownImage, height: 40.h),
            SizedBox(height: 10.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  plan["title"],
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: index == 1 ? Colors.white : textColor,
                  ),
                ),
                // SizedBox(width: 8.w),
                SizedBox(height: 8.h),
                Text(
                  plan["price"],
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              plan["details"],
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 12.h),
            Container(
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ElevatedButton(
                onPressed: () {
                  controller.selectPlan(index);
                  if (plan["title"] == "Premium Tier" ||
                      plan["title"] == "Supplement Add-On Plan") {
                    _showConfirmDialog(plan["title"], plan["price"], context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  plan["button"],
                  style: TextStyle(
                    color:
                        index == 1 ? const Color(0xFFFB4958) : Colors.black87,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmDialog(
    String planTitle,
    String planPrice,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    String selectedOption = "";

    Get.dialog(
      Dialog(
        backgroundColor: const Color(0xFF684548),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: StatefulBuilder(
          builder:
              (context, setState) => Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/logos.png', height: 40.h),
                    SizedBox(height: 10.h),
                    Text(
                      planTitle,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 6.h),
                          ..._getOptions(planTitle, planPrice).map(
                            (text) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio<String>(
                                  value: text,
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = value!;
                                    });
                                  },
                                  activeColor: Colors.white,
                                  fillColor: MaterialStateProperty.all(
                                    const Color(0xFFFFFFFF),
                                  ),
                                ),

                                Expanded(
                                  child: Text(text, style: _dialogTextStyle()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        if (selectedOption.isNotEmpty) {
                          controller.confirmPlan(selectedOption);
                          // Get.back();

                          Get.to(() => UserInfoSetup());
                          Get.snackbar(
                            'Subscription Successful!',
                            'Your subscription has been successfully activated.',
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: SizedBox(
                        width: screenWidth * 0.5,
                        height: 40.h,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  List<String> _getOptions(String planTitle, String planPrice) {
    if (planTitle == "Premium Tier") {
      // Split the planPrice string into individual options
      final options = planPrice.split(" or ");
      return options.map((option) => option.trim()).toList();
    } else if (planTitle == "Supplement Add-On Plan") {
      return [planPrice];
    }
    return [];
  }

  TextStyle _dialogTextStyle() {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
