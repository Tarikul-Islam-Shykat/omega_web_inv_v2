import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/nutritionist_support/controller/chat_controller.dart';
import 'package:prettyrini/feature/admin/nutritionist_support/model/chat_model.dart' show ChatConversation;
import 'package:prettyrini/feature/admin/nutritionist_support/widget/chat_widget.dart';

class ChatDetailPage extends StatelessWidget {
  final ChatConversation conversation;

  const ChatDetailPage({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChatDetailController controller = Get.put(ChatDetailController(conversation));
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final appBarHeight = screenHeight * 0.1;

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar
            Container(
              height: appBarHeight,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              decoration: const BoxDecoration(
                color: Color(0xFF1C1C1C),
                border: Border(
                  bottom: BorderSide(color: Color(0xFF3C3C3C), width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  
                  CircleAvatar(
                    radius: screenWidth * 0.05,
                    backgroundImage: NetworkImage(conversation.user.profileImage),
                  ),
                  
                  SizedBox(width: screenWidth * 0.03),
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          conversation.user.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (conversation.user.isOnline)
                          Text(
                            'online',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                      ],
                    ),
                  ),
                  
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Messages
            Expanded(
              child: Obx(() => ListView.builder(
                reverse: true,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages.reversed.toList()[index];
                  return ChatBubble(message: message);
                },
              )),
            ),

            // Message Input
            MessageInput(
              onSend: (message) => controller.sendMessage(),
              onChanged: controller.onMessageTextChanged,
            ),
          ],
        ),
      ),
    );
  }
}