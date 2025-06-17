import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';

void showSuccessDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onDonePressed,
  required Widget image,
  String? buttonText,
}) {
  final screenWidth = MediaQuery.of(context).size.width;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          // height: 280.h,
          // width: 287.w,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: Color(0xFF505050),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              image,
              SizedBox(height: 10.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFB4958),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                message,
                style: TextStyle(fontSize: 16.sp, color: Color(0xFFFFFFFF)),
                textAlign: TextAlign.center,
              ),
              if (buttonText != null) ...[
                SizedBox(height: 20.h),
                CustomButton(
                  height: 40.h,
                  width: screenWidth * 0.5,
                  backgroundColor: Color(0xFFFB4958),
                  borderRadius: 10.r,
                  text: buttonText,
                  onPressed: onDonePressed,
                ),
              ],
              SizedBox(height: 12.h),
            ],
          ),
        ),
      );
    },
  );
}
