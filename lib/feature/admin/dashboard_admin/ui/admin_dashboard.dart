// dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              _buildHeader(controller),
              SizedBox(height: 32),

              // Dashboard Cards Grid
              _buildDashboardGrid(controller, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(DashboardController controller) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Profile Image
          GestureDetector(
            onTap: () => controller.pickImageFromGallery(),
            child: Obx(() => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFFE53E3E),
                    borderRadius: BorderRadius.circular(12),
                    image: controller.profileImage.value != null
                        ? DecorationImage(
                            image: FileImage(controller.profileImage.value!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: controller.profileImage.value == null
                      ? Icon(
                          Icons.fitness_center,
                          color: Colors.white,
                          size: 30,
                        )
                      : null,
                )),
          ),
          SizedBox(width: 16),

          // Admin Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Welcome to Dashboard!',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Notification Badge
          // Container(
          //   width: 24,
          //   height: 24,
          //   decoration: BoxDecoration(
          //     color: Color(0xFFE53E3E),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: Center(
          //     child: Text(
          //       '5',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 12,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildDashboardGrid(
      DashboardController controller, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth > 600 ? 4 : 2;
    final childAspectRatio = screenWidth > 600 ? 1.2 : 1.0;

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: controller.dashboardData.length,
      itemBuilder: (context, index) {
        final entry = controller.dashboardData.entries.elementAt(index);
        return _buildDashboardCard(
          title: entry.key,
          value: entry.value,
          gradientColors: controller.getGradientForIndex(index),
          onTap: () => controller.onCardTap(entry.key, entry.value),
        );
      },
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required int value,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradientColors[0].withOpacity(0.3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title with arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white.withOpacity(0.8),
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),

              // Value
              Row(
                children: [
                  Spacer(),
                  Text(
                    value.toString().padLeft(2, '0'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
