import 'dart:developer';

import 'package:get/get.dart';
import 'package:omega_web_inv/core/repository/network_caller/endpoints.dart';
import 'package:omega_web_inv/core/repository/network_caller/network_config.dart';
import 'package:omega_web_inv/feature/user/workouts/model/workout_model.dart';

class AllWorkoutController extends GetxController{
  final NetworkConfig _networkConfig = NetworkConfig();

  @override
  onInit(){
    super.onInit();
    getAllWorkout();
  }
  RxList<GetAllWorkoutModel> allWorkout = <GetAllWorkoutModel>[].obs;
  RxBool isLoadingWorkout = false.obs;
  Future<bool> getAllWorkout()async{
    try{
      isLoadingWorkout.value = true;
      final response = await _networkConfig.ApiRequestHandler(RequestMethod.GET, Urls.allWorkout,
          {},is_auth: true);
      if(response != null && response["success"] == true){
        allWorkout.value =List<GetAllWorkoutModel>.from(response["data"].map((e)=>GetAllWorkoutModel.fromJson(e)));
        log("${response['message']}");
        return false;
      }else{
        log("${response['message']}");
        return false;
      }

    }catch(e){
      log("Request Failed ${e.toString()}");
      return false;
    }finally{
      isLoadingWorkout.value = false;
    }
  }

}