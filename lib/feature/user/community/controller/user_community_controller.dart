import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controller/custom_dropdown_controller.dart';
import '../model/user_comminity_model.dart';

class CommunityController extends GetxController {
  final dropDownController = CustomDropDownController();

  // Filter properties
  final RxBool showFilters = false.obs;
  final RxString selectedFilter = ''.obs;
  final filterOptions = ['All', 'Workout', 'nutrition', 'Yoga'];

  // Posts and comments
  final posts =
      <PostModel>[
        PostModel(
          id: '1',
          userName: 'Esther Howard',
          date: '03 March 2025',
          content: 'Work hard every day to improve yourself a little bit...',
          profileImage: 'assets/images/user1.png',
          imageUrl: 'assets/images/community1.png',
        ),
        PostModel(
          id: '2',
          userName: 'Cody Fisher',
          date: '03 March 2025',
          content: 'The gym isn\'t just a place — it\'s a battlefield...',
          profileImage: 'assets/images/user2.png',
        ),
        PostModel(
          id: '3',
          userName: 'Devon Lane',
          date: '03 March 2025',
          content: 'Work hard every day to improve yourself a little bit...',
          profileImage: 'assets/images/user3.png',
          imageUrl: 'assets/images/community3.png',
        ),
      ].obs;

  final RxMap<String, List<Comment>> postComments =
      <String, List<Comment>>{}.obs;
  final RxMap<String, TextEditingController> commentControllers =
      <String, TextEditingController>{}.obs;
  final RxMap<String, bool> showComments = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize comment controllers
    for (var post in posts) {
      commentControllers[post.id] = TextEditingController();
      postComments[post.id] = [];
      showComments[post.id] = false;
    }
  }

  void toggleComments(String postId) {
    showComments[postId] = !(showComments[postId] ?? false);
    showComments.refresh();
  }

  void addComment(String postId) {
    final controller = commentControllers[postId];
    if (controller != null && controller.text.isNotEmpty) {
      final post = posts.firstWhere((p) => p.id == postId);

      final newComment = Comment(
        username: 'You',
        text: controller.text,
        avatar: post.profileImage,
        time: 'Just now',
      );

      postComments[postId]!.insert(0, newComment);
      controller.clear();
      postComments.refresh();
    }
  }

  @override
  void onClose() {
    commentControllers.forEach((_, controller) => controller.dispose());
    super.onClose();
  }
}
