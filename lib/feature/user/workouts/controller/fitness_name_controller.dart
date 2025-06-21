import 'dart:developer';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/repository/network_caller/endpoints.dart';
import 'package:omega_web_inv/core/repository/network_caller/network_config.dart';
import 'package:omega_web_inv/feature/user/workouts/model/all_fitness_model.dart';

class FitnessNameController extends GetxController{
  final NetworkConfig _networkConfig = NetworkConfig();
  RxList<AllFitnessNameModel> fitnessNameModel = <AllFitnessNameModel>[].obs;
  RxBool isLoadingFitness = false.obs;

  @override
  onInit(){
    super.onInit();
    getAllFitnessName();
  }

  Future<bool> getAllFitnessName()async{
    try{
      isLoadingFitness.value = true;
      final response = await _networkConfig.ApiRequestHandler(RequestMethod.GET, Urls.fitnessName, {},is_auth: true);
      if(response != null && response['success']== true){
        fitnessNameModel.value = List<AllFitnessNameModel>.from(response["data"].map((e)=>AllFitnessNameModel.fromJson(e)));
        log("${response["message"]}");
        return false;
      }else{
        log("${response["message"]}");
        return false;
      }
    }catch(c){
      log("Failed for Get Fitness ${c.toString()}");
      return false;
    }finally{
      isLoadingFitness.value = false;
    }
  }

  RxList<String> selectedFitnessNames = <String>[].obs;

  void toggleSelection(String name) {
    if (selectedFitnessNames.contains(name)) {
      selectedFitnessNames.remove(name);
    } else {
      selectedFitnessNames.add(name);
    }
  }
  RxBool isDropdownOpen = false.obs;

  void toggleDropdown() {
    isDropdownOpen.toggle();
  }

  void closeDropdown() {
    isDropdownOpen.value = false;
  }
}