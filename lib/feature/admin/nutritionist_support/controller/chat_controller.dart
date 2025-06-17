import 'package:get/get.dart';
import '../chats/chat_details_page.dart';
import '../data/chat_data.dart';
import '../model/chat_model.dart';


class ChatController extends GetxController {
  final RxList<ChatConversation> conversations = <ChatConversation>[].obs;
  final RxString searchQuery = ''.obs;
  final RxList<ChatConversation> filteredConversations = <ChatConversation>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadConversations();
    ever(searchQuery, (_) => filterConversations());
  }

  void loadConversations() {
    conversations.value = ChatData.getConversations();
    filteredConversations.value = conversations;
  }

  void filterConversations() {
    if (searchQuery.value.isEmpty) {
      filteredConversations.value = conversations;
    } else {
      filteredConversations.value = conversations
          .where((conversation) => conversation.user.name
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase()))
          .toList();
    }
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  void openChat(ChatConversation conversation) {
    Get.to(() => ChatDetailPage(conversation: conversation));
  }

  int get totalUnreadCount {
    return conversations.fold(0, (sum, conversation) => sum + conversation.unreadCount);
  }
}

class ChatDetailController extends GetxController {
  final ChatConversation conversation;
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxString messageText = ''.obs;

  ChatDetailController(this.conversation);

  @override
  void onInit() {
    super.onInit();
    messages.value = conversation.messages;
  }

  void sendMessage() {
    if (messageText.value.trim().isNotEmpty) {
      final newMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'me',
        content: messageText.value.trim(),
        timestamp: DateTime.now(),
        isRead: true,
        isSentByMe: true,
      );
      
      messages.add(newMessage);
      messageText.value = '';
    }
  }

  void onMessageTextChanged(String text) {
    messageText.value = text;
  }
}