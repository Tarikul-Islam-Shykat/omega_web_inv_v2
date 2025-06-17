import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/user_community_controller.dart';
import '../model/user_comminity_model.dart';

class CommentSection extends StatelessWidget {
  final String postId;
  final CommunityController controller = Get.find();

  CommentSection({required this.postId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current post to access its profileImage
    final post = controller.posts.firstWhere((p) => p.id == postId);

    return Obx(() {
      final comments = controller.postComments[postId] ?? [];

      return Column(
        children: [
          // Existing comments
          if (comments.isNotEmpty)
            ...comments.map((comment) => _buildComment(comment)).toList(),

          // Comment input field - Now using post.profileImage
          Container(
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.grey[800]!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  backgroundImage: AssetImage(
                    post.profileImage,
                  ), // Changed here
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextField(
                    controller: controller.commentControllers[postId],
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Color(0xFFE14653)),
                  onPressed: () => controller.addComment(postId),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _buildComment(Comment comment) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: AssetImage(comment.avatar),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  comment.text,
                  style: TextStyle(fontSize: 13.sp, color: Colors.white70),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      comment.time,
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                    ),
                    SizedBox(width: 15.w),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Reply',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
