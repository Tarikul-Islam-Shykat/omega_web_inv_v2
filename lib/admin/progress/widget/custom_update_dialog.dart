// Custom Dialog Widget
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomUpdateDialog extends StatelessWidget {
  const CustomUpdateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Row(
                children: [
                  Text(
                    "Today's Update",
                    style: TextStyle(
                      color: Color(0xFFF5838C),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Divider(color: Colors.grey.withAlpha(50), height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                children: [
                  _buildDialogItem(context, "Weight", isFullWidth: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDialogItem(context, "Chest"),
                      _buildDialogItem(context, "Waist"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDialogItem(context, "Hips"),
                      _buildDialogItem(context, "Arms"),
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(12.w),
            //   child: CustomButton(
            //     height: 40.h,
            //     onPressed: () {
            //       Get.back();
            //       log("Update Clicked");
            //     },
            //     text: "Update",
            //     backgroundColor: Color(0xFFFB4958),
            //     borderRadius: 10.r,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogItem(
    BuildContext context,
    String title, {
    bool isFullWidth = false,
  }) {
    final sw = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        log("$title selected");
        Get.back();
      },
      child: Container(
        width: isFullWidth ? sw - 56.w : sw * 0.40,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(8.r),
        ),
        margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16.sp),
          ],
        ),
      ),
    );
  }
}
