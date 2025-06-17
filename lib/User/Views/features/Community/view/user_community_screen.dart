import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Community/controller/user_community_controller.dart';
import 'package:omega_web_inv/User/Views/features/Community/model/user_comminity_model.dart';
import 'package:omega_web_inv/User/Views/features/Community/view/user_comment_section.dart';
import 'package:omega_web_inv/User/Views/features/Home/widgets/user_profile_header.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommunityController());

    // Reactive dropdown states for filters
    final RxBool showFilters = false.obs;
    final RxString selectedFilter = ''.obs;
    final List<String> filterOptions = ['All', 'Workout', 'Nutrition', 'Yoga'];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            top: 40.h,
            bottom: 120.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileHeader(),
              SizedBox(height: 10.h),

              /// SEARCH + FILTER ROW
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF).withAlpha(18),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search.......',
                          suffixIcon: Icon(Icons.search),
                          suffixIconColor: Colors.white.withAlpha(50),
                          hintStyle: TextStyle(
                            color: Color(0xFFFFFFFF).withAlpha(50),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30.w),

                  GestureDetector(
                    onTap: () {
                      showFilters.value = !showFilters.value;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Filters',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Image.asset(
                            'assets/images/filter.png',
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              /// DROPDOWN OPTIONS
              Obx(() {
                if (!showFilters.value) return SizedBox.shrink();
                return Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Column(
                    children:
                        filterOptions.map((option) {
                          return GestureDetector(
                            onTap: () {
                              selectedFilter.value = option;
                              showFilters.value = false;
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(vertical: 10.h),
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                option,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                );
              }),

              SizedBox(height: 20.h),

              /// POSTS
              Obx(
                () => Column(
                  children:
                      controller.posts
                          .map((post) => PostCard(post: post))
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final PostModel post;
  const PostCard({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final controller = Get.find<CommunityController>();

    return Obx(
      () => Container(
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF).withAlpha(18),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post header (user info)
            Row(
              children: [
                Container(
                  height: 54.h,
                  width: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Image.asset(post.profileImage),
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.userName,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      post.date,
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h),

            // Post content
            Text(post.content, style: TextStyle(color: Colors.white)),

            // Post image (if exists)
            if (post.imageUrl != null) ...[
              SizedBox(height: 10.h),
              SizedBox(
                height: 150.h,
                width: sw * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(post.imageUrl!, fit: BoxFit.cover),
                ),
              ),
            ],
            SizedBox(height: 10.h),

            // Action buttons
            Container(
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(18),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Like Button
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 16.r,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Like',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Comment Button
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => controller.toggleComments(post.id),
                      child: Row(
                        children: [
                          Icon(
                            Icons.comment_outlined,
                            size: 16.r,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Comment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Message Button
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(
                            Icons.message_outlined,
                            size: 16.r,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Message',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Comment Section
            if (controller.showComments[post.id] == true)
              CommentSection(postId: post.id),
          ],
        ),
      ),
    );
  }
}
