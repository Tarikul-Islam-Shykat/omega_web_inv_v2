import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/admin/nutritionist_support/model/chat_model.dart';

class ChatListItem extends StatelessWidget {
  final ChatConversation conversation;
  final VoidCallback onTap;

  const ChatListItem({
    Key? key,
    required this.conversation,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.015,
        ),
        child: Row(
          children: [
            // Profile Image
            Stack(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.065,
                  backgroundImage: NetworkImage(conversation.user.profileImage),
                ),
                if (conversation.user.isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: screenWidth * 0.035,
                      height: screenWidth * 0.035,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF1C1C1C), width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            
            SizedBox(width: screenWidth * 0.04),
            
            // Message Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        conversation.user.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '12:00 am',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: screenWidth * 0.035,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: screenHeight * 0.005),
                  
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage.content,
                          style: TextStyle(
                            color: conversation.lastMessage.isRead 
                                ? Colors.white54 
                                : Colors.white70,
                            fontSize: screenWidth * 0.038,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      if (conversation.unreadCount > 0)
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 0.02),
                          padding: EdgeInsets.all(screenWidth * 0.015),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            conversation.unreadCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;

  const SearchBar({
    Key? key,
    required this.onChanged,
    this.hintText = 'Search......',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenWidth * 0.02,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF3C3C3C),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: const Icon(Icons.search, color: Colors.white54),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.035,
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      child: Row(
        mainAxisAlignment: message.isSentByMe 
            ? MainAxisAlignment.end 
            : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: screenWidth * 0.75,
            ),
            padding: EdgeInsets.all(screenWidth * 0.04),
            decoration: BoxDecoration(
              color: message.isSentByMe 
                  ? const Color(0xFF3C3C3C) 
                  : const Color(0xFF8B4513),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message.content,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  final Function(String) onSend;
  final Function(String) onChanged;

  const MessageInput({
    Key? key,
    required this.onSend,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1C),
        border: Border(
          top: BorderSide(color: Color(0xFF3C3C3C), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.attach_file, color: Colors.white54),
          ),
          
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Write Message',
                hintStyle: const TextStyle(color: Colors.white54),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                ),
              ),
            ),
          ),
          
          IconButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                onSend(controller.text.trim());
                controller.clear();
              }
            },
            icon: const Icon(Icons.send, color: Color(0xFFFF6B6B)),
          ),
        ],
      ),
    );
  }
}