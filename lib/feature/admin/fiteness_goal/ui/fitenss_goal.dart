import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/fitness_controller.dart';
import '../widget/fitness_goal_widgets.dart';


class FitnessGoalPage extends StatelessWidget {
  const FitnessGoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FitnessGoalController controller = Get.put(FitnessGoalController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = screenHeight * 0.1;
    final titleFontSize = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Container(
              height: appBarHeight,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    'Fitness Goal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Main Goal Card
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02,
              ),
              padding: EdgeInsets.all(screenWidth * 0.06),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    'Fitness Goal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.048,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    '03',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Goals List
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.12, // Space for fixed button
                    ),
                    itemCount: controller.goals.length,
                    itemBuilder: (context, index) {
                      final goal = controller.goals[index];
                      return GoalCard(
                        id: goal.id,
                        name: goal.name,
                        count: goal.count,
                        onEdit: () =>
                            controller.showEditDialog(goal.id, goal.name),
                        onDelete: () => controller.showDeleteConfirmation(
                            goal.id, goal.name),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),

      // Fixed Add Goal Button
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: FixedAddButton(
          onPressed: () => controller.showAddGoalDialog(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


