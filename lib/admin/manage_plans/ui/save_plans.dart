import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/admin/manage_plans/controller/save_plan_cnt.dart';
import 'package:omega_web_inv/admin/manage_plans/model/format_plan.dart';


class SavePlanPage extends StatelessWidget {
  const SavePlanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SavePlanController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Add Plan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plan Header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A2C2A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFFFD700),
                              size: 24,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white30),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Obx(() => Text(
                                    controller.selectedPlan.value,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Obx(() => Text(
                              controller.selectedPrice.value,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            )),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Features List
                  Obx(() => Column(
                        children:
                            controller.features.asMap().entries.map((entry) {
                          int index = entry.key;
                          SavePlanFeature feature = entry.value;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4A2C2A),
                              borderRadius: BorderRadius.circular(8),
                              border: feature.isSelected
                                  ? Border.all(color: Colors.white, width: 1)
                                  : Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    feature.feature,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => controller.toggleFeature(index),
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: feature.isSelected
                                          ? Colors.red
                                          : Colors.transparent,
                                      border: Border.all(
                                        color: feature.isSelected
                                            ? Colors.red
                                            : Colors.white30,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: feature.isSelected
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 14,
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )),

                  const SizedBox(height: 24),

                  // Go Premium Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle Go Premium action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE0E0E0),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Go Premium',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Save Plan Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: controller.savePlan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Save Plan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
