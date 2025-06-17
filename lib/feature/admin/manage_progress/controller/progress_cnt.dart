import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/progress_data.dart';
import '../model/progress_mode.dart';
import '../widget/progress_widget.dart';





class ManageProgressController extends GetxController {
  final RxList<UserProgress> userProgressList = <UserProgress>[].obs;
  final RxString searchQuery = ''.obs;
  final RxList<UserProgress> filteredProgressList = <UserProgress>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProgress();
    ever(searchQuery, (_) => filterUserProgress());
  }

  void loadUserProgress() {
    userProgressList.value = ProgressData.getUserProgressList();
    filteredProgressList.value = userProgressList;
  }

  void filterUserProgress() {
    if (searchQuery.value.isEmpty) {
      filteredProgressList.value = userProgressList;
    } else {
      filteredProgressList.value = userProgressList
          .where((user) => user.name
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  void showUserDetails(UserProgress user) {
    Get.dialog(
      UserProgressDialog(user: user),
    );
  }

  void updateUserProgress(String id, String newStatus, double newPercentage, bool isUp) {
    final index = userProgressList.indexWhere((user) => user.id == id);
    if (index != -1) {
      userProgressList[index] = userProgressList[index].copyWith(
        progressStatus: newStatus,
        progressPercentage: newPercentage,
        isProgressUp: isUp,
      );
      filterUserProgress(); // Update filtered list
    }
  }

  void deleteUser(String id) {
    userProgressList.removeWhere((user) => user.id == id);
    filterUserProgress(); // Update filtered list
  }

  void showDeleteConfirmation(String id, String name) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF2C2C2C),
        title: const Text(
          'Remove user',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to remove "$name" from progress tracking?',
          style: const TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () {
              deleteUser(id);
              Get.back();
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  int get totalUsers => userProgressList.length;
  
  int get improvedUsers => userProgressList.where((user) => user.isProgressUp).length;
  
  int get declinedUsers => userProgressList.where((user) => !user.isProgressUp).length;
}