import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/repository/network_caller/endpoints.dart';
import 'package:omega_web_inv/core/repository/network_caller/network_config.dart';
import 'package:omega_web_inv/feature/user/profile/model/get_me_user_model.dart';
import 'package:omega_web_inv/feature/user/profile/model/get_user_info_model.dart';

class GetUserController extends GetxController{
    Rx<UserInfoModel> userModel = UserInfoModel().obs;
    Rx<GetMeUserModel> getMeModel = GetMeUserModel().obs;
    RxBool isGetMeLoading = false.obs;
    RxBool isLoading = false.obs;
    final NetworkConfig _networkConfig = NetworkConfig();
    @override
    onInit(){
    super.onInit();
    getUserInfo();
    getMeUser();
    }


    //details with user info
    Future<bool> getUserInfo()async{
      isLoading.value = true;
      try{
        final response = await _networkConfig.ApiRequestHandler(RequestMethod.GET, Urls.getUserInfo, {},is_auth: true);

        if(response != null && response["success"] == true){
          userModel.value = UserInfoModel.fromJson(response["data"]);
          userModel.value = response['data'].map((e)=>UserInfoModel.fromJson(e));
          log("Get success user info${response["message"]}");
          return true;
        }else{
          log("Get failed user info ${response["message"]}");
          return false;
        }
      }catch(e){
        log("Failed get user ${e.toString()}");
        return false;
      }finally{
        isLoading.value = false;
      }
    }

    //just user info
  Future<bool> getMeUser()async{
    isGetMeLoading.value = true;
      try{
        final response  = await _networkConfig.ApiRequestHandler(RequestMethod.GET, Urls.getUserSingleInfo, {},is_auth: true);
        if(response != null && response["success"] == true){
          getMeModel.value = GetMeUserModel.fromJson(response["data"]);
          log(getMeModel.value.toString());
          log("${response["message"]}");
          return true;
        }else{
          log("API failed: ${response["message"] ?? 'No message'}");
          return false;
        }
      }catch(e){
        log("Response failed ${e.toString()}");
        return false;
      }finally{
        isGetMeLoading.value = false;
      }
  }


}