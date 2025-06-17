// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/chat/chatbox/chat_message.dart';
import 'package:omega_web_inv/User/Views/features/chat/chatbox/chatlist_controller/chat_controller.dart';
import 'package:omega_web_inv/User/Views/features/chat/chatbox/chatlist_model/chat_model.dart';
import 'package:omega_web_inv/core/global_widegts/custom_app_bar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.put(ChatController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Message',
              centerTitle: true,
              showBackButton: true,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: chatController.chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatController.chatList[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to ChatDetailScreen with the contact name
                        Get.to(() => ChatDetailScreen(contactName: chat.name));
                      },
                      child: _buildChatItem(context, chat),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, ChatModel chat) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(color: Color(0xFFFB4958).withAlpha(18)),
        child: Row(
          children: [
            Image.asset(chat.profileImage, height: 50.h, width: 50.w),
            // CircleAvatar(
            //   radius: 10.r,
            //   backgroundImage: AssetImage(chat.profileImage),
            // ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    chat.messagePreview,
                    style: TextStyle(color: Color(0xFF8D8B84), fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Timestamp
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.dateandtime,
                  style: TextStyle(color: Color(0xFF8D8B84), fontSize: 14.sp),
                ),
                SizedBox(height: 15.h),
                Text(
                  chat.timestamp,
                  style: TextStyle(color: Color(0xFF8D8B84), fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
