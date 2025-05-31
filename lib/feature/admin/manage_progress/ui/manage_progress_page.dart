import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/manage_progress/controller/progress_cnt.dart';
import 'package:prettyrini/feature/admin/manage_progress/widget/progress_widget.dart';

class ManageProgressPage extends StatelessWidget {
  const ManageProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ManageProgressController controller =
        Get.put(ManageProgressController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = screenHeight * 0.1;
    final titleFontSize = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
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
                    'Manage Progresss',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Main Progress Card
            Obx(() => Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.06),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7BD253).withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Manage Progress',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.048,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        controller.totalUsers.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )),

            // Search Bar
            ProgressSearchBar(
              onChanged: controller.onSearchChanged,
            ),

            // User Progress List
            Expanded(
              child: Obx(() => controller.filteredProgressList.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: screenWidth * 0.2,
                            color: Colors.white54,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'No users found',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: screenWidth * 0.045,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.only(
                        top: screenHeight * 0.01,
                        bottom: screenHeight * 0.02,
                      ),
                      itemCount: controller.filteredProgressList.length,
                      itemBuilder: (context, index) {
                        final user = controller.filteredProgressList[index];
                        return UserProgressCard(
                          user: user,
                          onTap: () => controller.showUserDetails(user),
                          onDelete: () => controller.showDeleteConfirmation(
                              user.id, user.name),
                        );
                      },
                    )),
            ),
          ],
        ),
      ),
    );
  }
}

// Progress Statistics Widget (Optional - can be added to show more insights)
class ProgressStatsCard extends StatelessWidget {
  final ManageProgressController controller;

  const ProgressStatsCard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() => Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.02,
          ),
          padding: EdgeInsets.all(screenWidth * 0.04),
          decoration: BoxDecoration(
            color: const Color(0xFF3C3C3C),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                'Total Users',
                controller.totalUsers.toString(),
                Colors.white,
                screenWidth,
              ),
              _buildStatItem(
                'Improved',
                controller.improvedUsers.toString(),
                Colors.green,
                screenWidth,
              ),
              _buildStatItem(
                'Declined',
                controller.declinedUsers.toString(),
                Colors.red,
                screenWidth,
              ),
            ],
          ),
        ));
  }

  Widget _buildStatItem(
      String label, String value, Color color, double screenWidth) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: screenWidth * 0.035,
          ),
        ),
      ],
    );
  }
}

// Main App (for testing)
class ProgressApp extends StatelessWidget {
  const ProgressApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Manage Progress',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ManageProgressPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(const ProgressApp());
}
