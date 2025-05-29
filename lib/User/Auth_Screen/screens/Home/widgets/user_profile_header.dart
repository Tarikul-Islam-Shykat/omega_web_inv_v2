// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth_Screen/controller/user_info_setup_controller.dart';

class UserProfileHeader extends StatelessWidget {
  final UserInfoSetupController controller =
      Get.find<UserInfoSetupController>();

  UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32.w,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF).withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: Radius.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    height: 60.h,
                    width: 60.w,
                    child: Obx(() {
                      final image = controller.selectedImage.value;
                      return image != null
                          ? Image.file(image, fit: BoxFit.cover)
                          : Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.cover,
                          );
                    }),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(
                          controller.userName.value.isEmpty
                              ? "Hi, Jenny Wilson"
                              : "Hi, ${controller.userName.value}",
                          style: TextStyle(
                            color: const Color(0xFFF5838C),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Go crush your goals!",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF).withAlpha(18),
                child: IconButton(
                  icon: const Icon(Icons.message_rounded, color: Colors.white),
                  iconSize: 24.sp,
                  onPressed: () {
                    Get.snackbar(
                      'Messages',
                      'Opening messages...',
                      backgroundColor: Colors.blue,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                ),
              ),
              SizedBox(width: 8.w),
              CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF).withAlpha(18),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  iconSize: 24.sp,
                  onPressed: () {
                    Get.snackbar(
                      'Notifications',
                      'Opening notifications...',
                      backgroundColor: Colors.blue,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
