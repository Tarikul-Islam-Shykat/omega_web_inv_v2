import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/admin/fiteness_goal/model/fitness_model.dart';
import 'package:omega_web_inv/admin/fiteness_goal/widget/fitness_goal_widgets.dart';




class FitnessGoalController extends GetxController {
  final RxList<FitnessGoal> goals = <FitnessGoal>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize with sample data
    goals.addAll([
      FitnessGoal(id: '1', name: 'Barbell Squat', count: 0),
      FitnessGoal(id: '2', name: 'Mountain Climbers', count: 0),
      FitnessGoal(id: '3', name: 'Pushups', count: 0),
      FitnessGoal(id: '4', name: 'Other', count: 0),
    ]);
  }

  void addGoal(String name) {
    final newGoal = FitnessGoal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      count: 0,
    );
    goals.add(newGoal);
  }

  void editGoal(String id, String newName) {
    final index = goals.indexWhere((goal) => goal.id == id);
    if (index != -1) {
      goals[index] = FitnessGoal(
        id: id,
        name: newName,
        count: goals[index].count,
      );
    }
  }

  void deleteGoal(String id) {
    goals.removeWhere((goal) => goal.id == id);
  }

  void showEditDialog(String id, String currentName) {
    Get.dialog(
      EditGoalDialog(
        currentName: currentName,
        onSave: (newName) {
          editGoal(id, newName);
          Get.back();
        },
      ),
    );
  }

  void showAddGoalDialog() {
    Get.dialog(
      AddGoalDialog(
        onAdd: (name) {
          addGoal(name);
          Get.back();
        },
      ),
    );
  }

  void showDeleteConfirmation(String id, String name) {
    Get.dialog(
      AlertDialog(
        backgroundColor: const Color(0xFF2C2C2C),
        title: const Text(
          'Delete Goal',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Are you sure you want to delete "$name"?',
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
              deleteGoal(id);
              Get.back();
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}