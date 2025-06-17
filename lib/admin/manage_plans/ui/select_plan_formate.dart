import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/manage_plans/controller/select_plan_cnt.dart';

class SelectFormatPage extends StatelessWidget {
  const SelectFormatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectFormatController());

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   leading: IconButton(
      //     icon: const Icon(Icons.close, color: Colors.white),
      //     onPressed: () => Get.back(),
      //   ),
      //   title: const Text(
      //     'Add Plan',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 18,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      //   elevation: 0,
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select Format',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Plans List
          Expanded(
            child: Obx(() => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: controller.plans.length,
                  itemBuilder: (context, index) {
                    final plan = controller.plans[index];
                    return GestureDetector(
                      onTap: () => controller.selectPlan(index),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: plan.cardColor,
                          borderRadius: BorderRadius.circular(12),
                          border: plan.isSelected
                              ? Border.all(color: Colors.red, width: 2)
                              : null,
                        ),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Crown and Title
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (plan.hasCrown) ...[
                                  const Icon(
                                    Icons.star,
                                    color: Color(0xFFFFD700),
                                    size: 24,
                                  ),
                                  const SizedBox(width: 8),
                                ],
                                Text(
                                  plan.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Price
                            Text(
                              plan.price,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Features
                            ...plan.features
                                .map((feature) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            '• ',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              feature,
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),

                            const SizedBox(height: 20),

                            // Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => controller.selectPlan(index),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: plan.title == "Premium Tier"
                                      ? const Color(0xFFFF6B6B)
                                      : const Color(0xFFE0E0E0),
                                  foregroundColor: plan.title == "Premium Tier"
                                      ? Colors.white
                                      : Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  plan.title == "Premium Tier"
                                      ? "Go Premium"
                                      : "Go Trial",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: plan.title == "Premium Tier"
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),

          // Next Button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: controller.goToNext,
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
                'Next',
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
