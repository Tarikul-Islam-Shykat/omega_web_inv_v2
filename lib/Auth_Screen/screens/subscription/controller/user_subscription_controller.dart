import 'dart:developer';

import 'package:get/get.dart';

class UserSubscriptionController extends GetxController {
  var selectedIndex = 0.obs;

  void selectPlan(int index) => selectedIndex.value = index;

  void confirmPlan(String selectedOption) {
    // Add logic to handle the selected plan confirmation
    log("Plan confirmed: $selectedOption");
  }
}
