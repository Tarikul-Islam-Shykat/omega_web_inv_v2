import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/nutritionist_support/controller/chat_controller.dart';
import 'package:prettyrini/feature/admin/nutritionist_support/widget/chat_widget.dart';

class TrainerSupportPage extends StatelessWidget {
  const TrainerSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
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
                  SizedBox(width: screenWidth * 0.15),
                  Text(
                    'Trainer Support',
                    style: TextStyle(
                      color: Color(0xFFF5838C),
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Support Info Card
            Obx(() => Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.001,
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.03),
                  decoration: BoxDecoration(
                    color: Color(0xFFD2C353).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Trainer Support',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.048,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        controller.totalUnreadCount.toString(),
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
            // SearchBar(
            //   onChanged: controller.onSearchChanged,
            // ),

            // Chat List
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredConversations.length,
                    itemBuilder: (context, index) {
                      final conversation =
                          controller.filteredConversations[index];
                      return ChatListItem(
                        conversation: conversation,
                        onTap: () => controller.openChat(conversation),
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
