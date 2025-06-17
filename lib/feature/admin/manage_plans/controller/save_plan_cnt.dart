import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/format_plan.dart';

class SavePlanController extends GetxController {
  final RxString selectedPlan = "Premium Tier".obs;
  final RxString selectedPrice = "\$9.99/month or \$79.99/year".obs;
  final RxList<SavePlanFeature> features = <SavePlanFeature>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadFeatures();
  }
  
  void loadFeatures() {
    features.value = [
      SavePlanFeature(feature: "Full workout library", isSelected: true),
      SavePlanFeature(feature: "AI-personalized plans", isSelected: true),
      SavePlanFeature(feature: "Full fitness + nutrition tracking", isSelected: true),
      SavePlanFeature(feature: "Health app integrations", isSelected: true),
      SavePlanFeature(feature: "Supplement recommendations + links", isSelected: true),
      SavePlanFeature(feature: "Priority support", isSelected: true),
    ];
  }
  
  void toggleFeature(int index) {
    features[index].isSelected = !features[index].isSelected;
    features.refresh();
  }
  
  void savePlan() {
    // Handle save plan logic
    Get.snackbar(
      "Plan Saved",
      "Your plan has been saved successfully!",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.back();
    Get.back();
  }
}