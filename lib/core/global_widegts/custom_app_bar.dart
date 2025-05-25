import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.showBackButton = true,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(12.0.w),
        child: Row(
          mainAxisAlignment:
              centerTitle == true
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
          children: [
            if (showBackButton) ...[
              GestureDetector(
                onTap: onBackPressed ?? () => Get.back(),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: const Color(0xFF187C82).withOpacity(0.19),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFF0B3A3D),
                    size: 20,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
            ],
            Expanded(
              child: Align(
                alignment:
                    centerTitle == true
                        ? Alignment.center
                        : Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF1F3892),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
