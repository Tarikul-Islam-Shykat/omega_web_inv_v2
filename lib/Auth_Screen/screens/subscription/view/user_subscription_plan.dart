import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/Auth_Screen/screens/subscription/controller/user_subscription_controller.dart';
import 'package:omega_web_inv/core/global_widegts/custom_app_bar.dart';

class UserSubscriptionPlan extends StatelessWidget {
  final controller = Get.put(UserSubscriptionController());

  final RxList<Map<String, dynamic>> plans =
      [
        {
          "title": "Core (Free)",
          "details": "* 1 Contact\n* 1 x 60-sec video\n* Basic details",
          "button": "Choose Free Trial",
          "highlight": false,
        },
        {
          "title": "Taster Plans",
          "details":
              "* 3 months full access\n* 1 Contact £9\n* 3 Contacts £13\n* 6 Contacts £18",
          "button": "Choose This Plan",
          "highlight": false,
        },
        {
          "title": "Plan 1",
          "details":
              "* 1 Contact\n* £29/year\n* £69/3 years\n* £199/lifetime  (for users aged 55+)",
          "button": "Choose This Plan",
          "highlight": false,
        },
        {
          "title": "Plan 2",
          "details":
              "* 3 Contacts\n* £39/year\n* £99/3 years\n* £299/lifetime  (for users aged 55+)",
          "button": "Choose This Plan",
          "highlight": false,
        },
        {
          "title": "Plan 3",
          "details":
              "* 6 Contacts\n* £49/year\n* £119/3 years\n* £399/lifetime  (for users aged 55+)",
          "button": "Activate This Plan",
          "highlight": true,
        },
      ].obs;

  UserSubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCD3E4),
      body: SafeArea(
        child: Obx(
          () => ListView(
            padding: EdgeInsets.all(16.w),
            children: [
              CustomAppBar(
                title: 'Subscription Plan',
                centerTitle: true,
                showBackButton: false,
                onBackPressed: () => Get.back(),
              ),
              SizedBox(height: 16.h),
              ...plans.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> plan = entry.value;
                final isSelected = controller.selectedIndex.value == index;
                return _buildPlanCard(plan, index, isSelected);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard(Map<String, dynamic> plan, int index, bool isSelected) {
    final highlight = plan["highlight"] == true;
    final bgColor =
        highlight ? const Color(0xFF1F2C6C) : const Color(0xFFD7E1F8);
    final textColor = highlight ? Colors.white : const Color(0xFF162868);

    return GestureDetector(
      onTap: () => controller.selectPlan(index),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? const Color(0xFFFBB040) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/images/logos.png', height: 40.h)),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                plan["title"],
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              plan["details"],
              style: TextStyle(fontSize: 14.sp, color: textColor),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient:
                    highlight
                        ? const LinearGradient(
                          colors: [Color(0xFFFBB040), Color(0xFFF9ED32)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                        : null,
                color: highlight ? null : const Color(0xFF1F3892),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ElevatedButton(
                onPressed: () {
                  controller.selectPlan(index);
                  if (highlight) {
                    _showConfirmDialog(plan["title"]);
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
                    color: Colors.white,
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

  void _showConfirmDialog(String planTitle) {
    String selectedOption = "";

    Get.dialog(
      Dialog(
        backgroundColor: const Color(0xFF1F2C6C),
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
                        color: Color(0xFFFBDB6B),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 20.w),
                              Text("• 6 Contacts", style: _dialogTextStyle()),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          ...[
                            "£49 for 1 year",
                            "£119 for 3 years",
                            "£369 lifetime (55+)",
                          ].map(
                            (text) => Row(
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
                                  fillColor: WidgetStateProperty.all(
                                    Color(0xFFF4E6B3),
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
                          Get.back();
                          // Get.to(() => UserPayment());
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please select a payment option",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFFBB040), Color(0xFFF9ED32)],
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                color: Colors.black,
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

  TextStyle _dialogTextStyle() {
    return TextStyle(
      color: Color(0xFFF4E6B3),
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
