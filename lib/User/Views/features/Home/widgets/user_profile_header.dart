// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth/controller/user_info_setup_controller.dart';
import 'package:omega_web_inv/User/Views/features/Notification/view/notification_screen.dart';
import 'package:omega_web_inv/User/Views/features/chat/chatbox/chat_list.dart';
import 'package:omega_web_inv/User/Views/features/profile/view/user_profile_screen.dart';

class UserProfileHeader extends StatelessWidget {
  final UserInfoSetupController controller =
      Get.find<UserInfoSetupController>();
  final bool showBackButton;
  final bool showGreetingPrefix;
  final String? subtitleText;
  final bool showNotificationIcon;

  UserProfileHeader({
    super.key,
    this.showBackButton = false,
    this.showGreetingPrefix = true,
    this.subtitleText,
    this.showNotificationIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20.w,
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
          bottomLeft: Radius.circular(12.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildUserInfoSection(), _buildActionIcons()],
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return Expanded(
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: CircleAvatar(
                backgroundColor: Colors.white.withAlpha(18),
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Get.back(),
            ),
          SizedBox(width: 5.w),
          GestureDetector(
            onTap: () => Get.to(() => UserProfileScreen()),
            child: _buildUserAvatar(),
          ),
          SizedBox(width: 10.w),
          _buildUserGreeting(),
        ],
      ),
    );
  }

  Widget _buildUserAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: SizedBox(
        height: 60.h,
        width: 60.w,
        child: Obx(() {
          final image = controller.selectedImage.value;
          return image != null
              ? Image.file(image, fit: BoxFit.cover)
              : Image.asset('assets/images/user.png', fit: BoxFit.cover);
        }),
      ),
    );
  }

  Widget _buildUserGreeting() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            final userName = controller.userName.value.trim();
            String greetingText;

            if (showGreetingPrefix) {
              // Show "Hi, Jenny Wilson" if name is empty
              greetingText = userName.isEmpty ? "Hi, Jenny Wilson" : userName;
            } else {
              greetingText = userName;
            }

            return Text(
              greetingText,
              style: TextStyle(
                color: const Color(0xFFF5838C),
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            );
          }),
          SizedBox(height: 8.h),
          Text(
            subtitleText ?? "Go crush your goals!",
            style: TextStyle(color: Colors.white70, fontSize: 12.sp),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconButton(
          icon: Icons.message_rounded,
          tooltip: 'Messages',
          onPressed: () {
            Get.to(() => ChatScreen());
          },
          // _showSnackbar('Messages', 'Opening messages...'),
        ),
        if (showNotificationIcon) SizedBox(width: 8.w),
        if (showNotificationIcon)
          _buildIconButton(
            icon: Icons.notifications_none,
            tooltip: 'Notifications',
            onPressed: () {
              Get.to(() => NotificationScreen());
            },
            // _showSnackbar('Notifications', 'Opening notifications...'),
          ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return CircleAvatar(
      backgroundColor: Colors.white.withAlpha(18),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        iconSize: 24.sp,
        tooltip: tooltip,
        onPressed: onPressed,
      ),
    );
  }

  void _showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
