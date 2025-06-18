import 'dart:developer';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/repository/network_caller/network_config.dart';
import 'package:omega_web_inv/feature/user/home/model/workout_plan_model.dart';
import '../../../../core/repository/network_caller/endpoints.dart';
import 'goal_controller.dart';

class WorkoutPlanController extends GetxController {
  final NetworkConfig _networkConfig = NetworkConfig();
  var completedExercises = <String>[].obs;
  final RxInt remainingCalories = 0.obs;

  final GoalController goalController = Get.find();

  @override
  onInit(){
    super.onInit();
    getWorkOut();
  }

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

  RxList<WorkOutPlanModel> workOutPlan = <WorkOutPlanModel>[].obs;
  RxBool isGetWorkOut = false.obs;
  Future<bool> getWorkOut()async{
    try{
      isGetWorkOut.value = true;
      final response = await _networkConfig.ApiRequestHandler(RequestMethod.GET, Urls.workoutPlan, {},is_auth: true);
      if(response != null && response["success"] == true){
        workOutPlan.value = List<WorkOutPlanModel>.from(response["data"].map((e)=>WorkOutPlanModel.fromJson(e)));
        log("${response["message"]}");
        return true;
      }else{
        log("${response["message"]}");
        return false;
      }
    }catch(e){
      log("Get Work out Failed ${e.toString()}");
      return false;
    }finally{
      isGetWorkOut.value = false;
    }
  }

}
