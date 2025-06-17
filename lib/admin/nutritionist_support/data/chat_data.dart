
import 'package:omega_web_inv/admin/nutritionist_support/model/chat_model.dart';

class ChatData {
  static List<ChatConversation> getConversations() {
    return [
      ChatConversation(
        id: '1',
        user: ChatUser(
          id: '1',
          name: 'Esther Howard',
          profileImage: 'https://i.pravatar.cc/150?img=1',
          isOnline: true,
        ),
        messages: [
          ChatMessage(
            id: '1',
            senderId: '1',
            content: "I can't eat oats with banana—it causes acidity. What can I eat instead? What would be a better alternative?",
            timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
            isRead: false,
            isSentByMe: false,
          ),
          ChatMessage(
            id: '2',
            senderId: 'me',
            content: "1. If oats and banana are causing acidity, try switching to alternatives like soaked chia seeds, quinoa, or whole grain toast for breakfast.\n\n2. Instead of banana, you can go for fruits that are gentler on the stomach such as papaya, apple (peeled), or melon.\n\n3. Try cooking oats with more water or milk and add a pinch of cinnamon—it may reduce acidity for some people.......Seemore",
            timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
            isRead: true,
            isSentByMe: true,
          ),
        ],
        lastMessage: ChatMessage(
          id: '1',
          senderId: '1',
          content: "This is an unread message...",
          timestamp: DateTime.now(),
          isRead: false,
          isSentByMe: false,
        ),
        unreadCount: 2,
      ),
      ChatConversation(
        id: '2',
        user: ChatUser(
          id: '2',
          name: 'Cody Fisher',
          profileImage: 'https://i.pravatar.cc/150?img=2',
          isOnline: false,
        ),
        messages: [
          ChatMessage(
            id: '3',
            senderId: '2',
            content: "What's the best pre-workout meal for morning exercises?",
            timestamp: DateTime.now().subtract(const Duration(hours: 1)),
            isRead: false,
            isSentByMe: false,
          ),
        ],
        lastMessage: ChatMessage(
          id: '3',
          senderId: '2',
          content: "This is an unread message...",
          timestamp: DateTime.now(),
          isRead: false,
          isSentByMe: false,
        ),
        unreadCount: 1,
      ),
      ChatConversation(
        id: '3',
        user: ChatUser(
          id: '3',
          name: 'Devon Lane',
          profileImage: 'https://i.pravatar.cc/150?img=3',
          isOnline: false,
        ),
        messages: [
          ChatMessage(
            id: '4',
            senderId: '3',
            content: "Thank you for the meal plan suggestions!",
            timestamp: DateTime.now().subtract(const Duration(hours: 2)),
            isRead: true,
            isSentByMe: false,
          ),
        ],
        lastMessage: ChatMessage(
          id: '4',
          senderId: '3',
          content: "This is a read message......",
          timestamp: DateTime.now(),
          isRead: true,
          isSentByMe: false,
        ),
        unreadCount: 0,
      ),
    ];
  }
}