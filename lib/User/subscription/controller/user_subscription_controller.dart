import 'dart:developer';

import 'package:get/get.dart';

// class SubscriptionController extends GetxController {
//   var selectedIndex = 0.obs;
//   var selectedPlanName = ''.obs;

//   void selectPlan(int index) => selectedIndex.value = index;

//   void confirmPlan(String selectedOption, String planName) {
//     selectedPlanName.value = planName;
//     log("Plan confirmed: $selectedOption ($planName)");
//   }
// }

class SubscriptionController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedPlanName = ''.obs;
  var selectedPlanPrice = ''.obs;
  var selectedPlanFeatures = <String>[].obs;
  var activationDate = ''.obs;
  var renewalDate = ''.obs;

  void confirmPlan({
    required String selectedOption,
    required String planName,
    required String price,
    required List<String> features,
    required String activatedOn,
    required String renewalOn,
  }) {
    selectedPlanName.value = planName;
    selectedPlanPrice.value = price;
    selectedPlanFeatures.assignAll(features);
    activationDate.value = activatedOn;
    renewalDate.value = renewalOn;
    log("Plan confirmed: $selectedOption ($planName)");
  }

  void selectPlan(int index) => selectedIndex.value = index;

  // void confirmPlan(String selectedOption, String planName) {
  //   selectedPlanName.value = planName;
  //   log("Plan confirmed: $selectedOption ($planName)");
  // }
}
