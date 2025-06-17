class ChatUser {
  final String id;
  final String name;
  final String profileImage;
  final bool isOnline;

  ChatUser({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.isOnline,
  });
}

class ChatMessage {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final bool isSentByMe;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    required this.isRead,
    required this.isSentByMe,
  });
}

class ChatConversation {
  final String id;
  final ChatUser user;
  final List<ChatMessage> messages;
  final ChatMessage lastMessage;
  final int unreadCount;

  ChatConversation({
    required this.id,
    required this.user,
    required this.messages,
    required this.lastMessage,
    required this.unreadCount,
  });
}