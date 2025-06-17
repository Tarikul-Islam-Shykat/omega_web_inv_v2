// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Home/widgets/user_profile_header.dart';
import 'package:omega_web_inv/User/Views/features/profile/view/user_personal_info.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            top: 20.h,
            bottom: 120.h,
          ),
          child: Column(
            children: [
              UserProfileHeader(
                showBackButton: true,
                showGreetingPrefix: true,
                subtitleText: 'Welcome to Profile!',
                showNotificationIcon: false,
              ),
              SizedBox(height: 20.h),

              // "Say something..." section
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        textAlign: TextAlign.start,
                        'Say Something...',
                        style: TextStyle(color: Color(0xFFA9A9A9)),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9).withAlpha(50),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Colors.white.withAlpha(50),
                                ),
                                Text(
                                  'Images',
                                  style: TextStyle(
                                    color: const Color(0xFFA9A9A9),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9D9D9).withAlpha(50),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.video_call,
                                  color: Colors.white.withAlpha(50),
                                ),
                                Text(
                                  'Video',
                                  style: TextStyle(
                                    color: const Color(0xFFA9A9A9),
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Get.to(() => UserPersonalInfo());
                },
                child: Container(
                  height: 35.h,
                  width: sw * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(18),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal Info',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Posts Section
              _buildProfilePosts(sw),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePosts(double sw) {
    return Column(
      children: [
        _buildPostCard(
          sw: sw,
          userName: 'Jenny Wilson',
          date: '03 March 2025',
          content:
              'Work hard every day to improve yourself a little bit — today\'s hardship will be tomorrow\'s strength.',
          profileImage: 'assets/images/user1.png',
        ),
        SizedBox(height: 15.h),
        _buildPostCard(
          sw: sw,
          userName: 'Jenny Wilson',
          date: '03 March 2025',
          content:
              'The gym isn\'t just a place — it\'s a battlefield. Every day of shoes is a step toward discships, every eye is embolied that you are stronger than yesterday. Show up, push hard, and let your effort speak louder than excluse. Your future will be watching — don\'t let them down.',
          profileImage: 'assets/images/user1.png',
        ),
      ],
    );
  }

  Widget _buildPostCard({
    required double sw,
    required String userName,
    required String date,
    required String content,
    required String profileImage,
  }) {
    return Container(
      width: sw * 0.95,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(18),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info header
          Row(
            children: [
              Container(
                height: 60.h,
                width: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(profileImage),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            log('3dot tapped');
                            showDialog(
                              context: _scaffoldKey.currentContext!,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(16.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[850],
                                            minimumSize: Size(120.w, 40.h),
                                          ),
                                          child: const Text(
                                            'Edit',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.h),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[850],
                                            minimumSize: Size(120.w, 40.h),
                                          ),
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/images/3dot.png',
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // Post content
          Text(
            content,
            style: TextStyle(color: Colors.white, fontSize: 14.sp, height: 1.5),
          ),
          SizedBox(height: 12.h),

          // Divider
          Divider(color: Colors.white.withOpacity(0.1), thickness: 1),
          SizedBox(height: 8.h),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActionButton(Icons.thumb_up_outlined, 'Like'),
              _buildActionButton(Icons.comment_outlined, 'Comment'),
              _buildActionButton(Icons.message_rounded, 'Message'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: 20.sp),
      label: Text(text, style: TextStyle(color: Colors.white, fontSize: 12.sp)),
    );
  }
}
