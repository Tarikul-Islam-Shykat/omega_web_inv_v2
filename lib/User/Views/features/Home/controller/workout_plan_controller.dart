import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Home/controller/goal_controller.dart';

class WorkoutPlanController extends GetxController {
  var completedExercises = <String>[].obs;
  final RxInt remainingCalories = 0.obs;

  final GoalController goalController = Get.find();

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
