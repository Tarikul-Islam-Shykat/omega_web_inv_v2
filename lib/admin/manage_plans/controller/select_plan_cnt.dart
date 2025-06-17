import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/admin/manage_plans/model/format_plan.dart';
import 'package:omega_web_inv/admin/manage_plans/ui/save_plans.dart';


class SelectFormatController extends GetxController {
  final RxList<FormatPlanModel> plans = <FormatPlanModel>[].obs;
  final RxInt selectedPlanIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    loadPlans();
  }

  void loadPlans() {
    plans.value = [
      FormatPlanModel(
        title: "Premium Tier",
        price: "\$9.99/month or \$79.99/year",
        features: [
          "Full workout library",
          "AI-personalized plans",
          "Full fitness + nutrition tracking",
          "Health app integrations",
          "Supplement recommendations + links",
          "Priority support"
        ],
        cardColor: Colors.red.withOpacity(0.2),
        hasCrown: true,
      ),
      FormatPlanModel(
        title: "Free Trial",
        price: "7-day free trial or \$1 first month",
        features: [
          "Full workout library",
          "AI-personalized plans",
          "Full fitness + nutrition tracking",
          "Health app integrations",
          "Supplement recommendations + links",
          "Priority support"
        ],
        cardColor: Colors.grey.shade900,
        hasCrown: true,
      ),
    ];
  }

  void selectPlan(int index) {
    selectedPlanIndex.value = index;
    for (int i = 0; i < plans.length; i++) {
      plans[i].isSelected = i == index;
    }
    plans.refresh();
  }

  void goToNext() {
    if (selectedPlanIndex.value >= 0) {
      Get.to(() => SavePlanPage());
    } else {
      Get.snackbar(
        "Selection Required",
        "Please select a plan to continue",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
