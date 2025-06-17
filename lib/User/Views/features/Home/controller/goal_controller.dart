import 'package:get/get.dart';

class GoalController extends GetxController {
  // Observable variables for dynamic values
  RxString todayGoals = '60%'.obs;
  RxString caloriesBurned = '540 Kcal'.obs;
  RxString caloriesEaten = '1200 Kcal'.obs;

  // Function to update calories burned
  void updateCaloriesBurned(String newValue) {
    caloriesBurned.value = '$newValue Kcal';
  }

  // Function to update calories eaten
  void updateCaloriesEaten(String newValue) {
    caloriesEaten.value = '$newValue Kcal';
  }

  // Function to update today's goal
  void updateTodayGoals(String newPercentage) {
    todayGoals.value = '$newPercentage%';
  }
}
