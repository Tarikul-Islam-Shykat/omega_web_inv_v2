// ignore_for_file: use_super_parameters, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatDetailScreen extends StatelessWidget {
  final String contactName;

  const ChatDetailScreen({Key? key, required this.contactName})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.white.withAlpha(18),
            child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Image.asset('assets/images/user3.png', height: 40.h, width: 40.w),
            const SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'online',
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              children: [
                _buildReceivedMessage(
                  'Can you tell me what workouts you do for weight loss?',
                  'Sent',
                ),
                SizedBox(height: 16.h),
                _buildSentMessage('Of course, I will tell you.'),
                SizedBox(height: 16.h),
                _buildSentMessage('Do you want to lose weight?'),
              ],
            ),
          ),
          _buildMessageInputField(context),
        ],
      ),
    );
  }

  Widget _buildReceivedMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 280.w,
        ), // Maximum width for the message bubble
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
            SizedBox(height: 4.h),
            Text(time, style: TextStyle(color: Colors.grey, fontSize: 10.sp)),
          ],
        ),
      ),
    );
  }

  Widget _buildSentMessage(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 280.w,
        ), // Maximum width for the message bubble
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Color(0xFF4B4B4B),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              bottomRight: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            ),
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInputField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFA3A3A3).withOpacity(0.10),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Color(0xFFA3A3A3).withOpacity(0.10),
            child: Image.asset('assets/images/send.png', height: 30, width: 30),
          ),
        ],
      ),
    );
  }
}
