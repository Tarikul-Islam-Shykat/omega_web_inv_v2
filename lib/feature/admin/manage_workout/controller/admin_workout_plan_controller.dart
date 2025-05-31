import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/manage_nutrition/controller/admin_goal_controller.dart';

class AdminWorkoutPlanController extends GetxController {
  var completedExercises = <String>[].obs;
  final RxInt remainingCalories = 0.obs;

  final AdminGoalController goalController = Get.put(AdminGoalController());

  bool _isInitialized = false;

  void initializeCalories(String calorieCount) {
    if (!_isInitialized) {
      remainingCalories.value = int.tryParse(calorieCount) ?? 0;
      _isInitialized = true;
    }
  }

  void completeExercise(String kcal, String exerciseId) {
    if (!completedExercises.contains(exerciseId)) {
      int kcalValue = int.parse(kcal);

      if (remainingCalories.value >= kcalValue) {
        remainingCalories.value -= kcalValue;
      } else {
        remainingCalories.value = 0;
      }

      goalController.updateCaloriesBurned(
        (int.parse(goalController.caloriesBurned.value.split(' ')[0]) +
                kcalValue)
            .toString(),
      );

      completedExercises.add(exerciseId);
    }
  }
}
