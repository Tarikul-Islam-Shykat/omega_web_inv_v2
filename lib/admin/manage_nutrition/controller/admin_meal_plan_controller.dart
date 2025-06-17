import 'package:get/get.dart';
import 'package:omega_web_inv/admin/manage_nutrition/controller/admin_goal_controller.dart';


class AdminMealPlanController extends GetxController {
  var remainingCalories = 0.obs;
  var completedExercises = <String>[].obs;
  bool _isInitialized = false;

  final AdminGoalController controller = Get.put(AdminGoalController());

  void completeExercise(String kcal, String exerciseId) {
    if (!completedExercises.contains(exerciseId)) {
      int kcalValue = int.parse(kcal);

      if (remainingCalories.value >= kcalValue) {
        remainingCalories.value -= kcalValue;
      } else {
        remainingCalories.value = 0;
      }

      controller.updateCaloriesBurned(
        (int.parse(controller.caloriesBurned.value.split(' ')[0]) + kcalValue)
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
