import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/admin/manage_plans/model/plan_model.dart';


class ManagePlanController extends GetxController {
  final RxList<PlanModel> plans = <PlanModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPlans();
  }

  void loadPlans() {
    plans.value = [
      PlanModel(
        title: "Freemium Tier (Free Plan)",
        features: [
          "Limited workouts (3-5)",
          "Basic nutrition tracking",
          "Daily steps + hydration tracking",
          "Supplement reminders",
          "Community access (basic)"
        ],
        buttonText: "Go Free Plan",
        cardColor: const Color(0xFF4A4A4A),
        buttonColor: const Color(0xFFE0E0E0),
        buttonTextColor: Colors.black,
        hasCrown: true,
      ),
      PlanModel(
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
        buttonText: "Go Premium",
        cardColor: const Color(0xFF2D2D2D),
        buttonColor: const Color(0xFFFF6B6B),
        buttonTextColor: Colors.white,
        hasCrown: true,
      ),
      PlanModel(
        title: "Free Trial",
        subtitle: "7-day free trial or \$1 first month",
        features: [
          "Full workout library",
          "AI-personalized plans",
          "Full fitness + nutrition tracking",
          "Health app integrations",
          "Supplement recommendations + links",
          "Priority support"
        ],
        buttonText: "Go Trial",
        cardColor: Colors.red.withOpacity(0.2),
        buttonColor: const Color(0xFFE0E0E0),
        buttonTextColor: Colors.black,
        hasCrown: true,
      ),
    ];
  }

  void selectPlan(int index) {
    // Handle plan selection
    print("Selected plan: ${plans[index].title}");
  }

  void addPlan() {
    // Handle add plan action
    print("Add Plan clicked");
  }
}
