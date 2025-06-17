import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/const/image_path.dart';
import '../controller/user_manage_contrller.dart';
import '../model/user_all_data.dart';


class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Manage Users',
          style: TextStyle(
            color: Color(0xFFFF6B6B),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Custom Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Obx(() => Row(
                  children: [
                    _buildTabItem(controller, 0, 'All user'),
                    _buildTabItem(controller, 1, 'Paid user'),
                    _buildTabItem(controller, 2, 'Nonpaid user'),
                  ],
                )),
          ),

          // Tab Content
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: [
                _buildUserList(controller, UserType.all),
                _buildUserList(controller, UserType.paid),
                _buildUserList(controller, UserType.nonPaid),
              ],
            ),
          ),

          // Bottom Buttons (Non-scrollable)
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Send Notification Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: controller.sendNotification,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B6B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Send notification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Generate Discount Code Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: controller.generateDiscountCode,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFF6B6B)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Generate Discount Code',
                      style: TextStyle(
                        color: Color(0xFFFF6B6B),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(UserController controller, int index, String title) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.onTabChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: controller.selectedTabIndex.value == index
                ? Colors.grey[700]
                : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: controller.selectedTabIndex.value == index
                  ? Colors.white
                  : Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserList(UserController controller, UserType userType) {
    return Obx(() {
      List<User> users;
      switch (userType) {
        case UserType.paid:
          users = controller.paidUsers;
          break;
        case UserType.nonPaid:
          users = controller.nonPaidUsers;
          break;
        default:
          users = controller.allUsers;
      }

      return Column(
        children: [
          // User Count Header
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF2D1B69),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  userType.displayName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${users.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // User List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      // User Avatar
                      CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey[700],
                          child: Image.asset(ImagePath.profile)),

                      const SizedBox(width: 16),

                      // User Name
                      Expanded(
                        child: Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      // Paid/Non-paid indicator
                      // if (userType == UserType.all)
                      //   Container(
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 8,
                      //       vertical: 4,
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: user.isPaid ? Colors.green : Colors.orange,
                      //       borderRadius: BorderRadius.circular(12),
                      //     ),
                      //     child: Text(
                      //       user.isPaid ? 'Paid' : 'Non-paid',
                      //       style: const TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 12,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
