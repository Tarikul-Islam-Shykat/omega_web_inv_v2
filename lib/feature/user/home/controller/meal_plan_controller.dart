import 'package:get/get.dart';
import 'goal_controller.dart';

class MealPlanController extends GetxController {
  var remainingCalories = 0.obs;
  var completedExercises = <String>[].obs;
  bool _isInitialized = false;

  final GoalController goalController = Get.find();

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

  void initializeCalories(String calorieCount) {
    if (!_isInitialized) {
      remainingCalories.value = int.tryParse(calorieCount) ?? 0;
      _isInitialized = true;
    }
  }
}
