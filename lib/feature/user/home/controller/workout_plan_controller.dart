import 'dart:developer';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/global_widegts/app_snackbar.dart';
import 'package:omega_web_inv/core/repository/network_caller/network_config.dart';
import 'package:omega_web_inv/feature/user/home/model/workout_plan_model.dart';
import '../../../../core/repository/network_caller/endpoints.dart';

class WorkoutPlanController extends GetxController {
  final NetworkConfig _networkConfig = NetworkConfig();
  RxInt totalBurnedCalories = 0.obs;
  @override
  onInit(){
    super.onInit();
    getWorkOut();
  }

  RxList<WorkOutPlanModel> workOutPlan = <WorkOutPlanModel>[].obs;
  RxBool isGetWorkOut = false.obs;
  RxBool isLoadingComplete= false.obs;
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

  Future<bool> workoutCompleted(String id, int kcal, int index) async {
    isLoadingComplete.value = true;
    try {
      final response = await _networkConfig.ApiRequestHandler(
        RequestMethod.PATCH,
        "${Urls.completeWorkoutPlan}/$id",
        {},
        is_auth: true,
      );

      if (response != null && response["success"] == true) {
        AppSnackbar.show(message: "${response["message"]}", isSuccess: true);


        totalBurnedCalories.value += kcal;


        workOutPlan[index].isCompleted = true;
        workOutPlan.refresh();

        return true;
      } else {
        AppSnackbar.show(message: "${response["message"]}", isSuccess: false);
        log("failed patch data ${response["message"]}");
        return false;
      }
    } catch (e) {
      AppSnackbar.show(message: e.toString(), isSuccess: false);
      log("failed Response patch data ${e.toString()}");
      return false;
    } finally {
      isLoadingComplete.value = false;
    }
  }


}
