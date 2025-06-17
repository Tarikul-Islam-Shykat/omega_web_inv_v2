import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/chat/chatbox/chatlist_model/chat_model.dart';

class ChatController extends GetxController {
  var chatList = <ChatModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    chatList.addAll([
      ChatModel(
        profileImage: "assets/images/trainer.png",
        name: 'Nutritionist',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/trainer.png",
        name: 'Trainer',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user3.png",
        name: 'Esther Howard',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user.png",
        name: 'Cody Fisher',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user3.png",
        name: 'Devon Lane',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user1.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user2.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '2:55 PM',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user3.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '2:55 PM',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user1.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '2:55 PM',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user2.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '2:55 PM',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user2.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user3.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
      ChatModel(
        profileImage: "assets/images/user1.png",
        name: 'Brooklyn Simmons',
        messagePreview: 'Greetings from the kitchen! Tod...',
        timestamp: '12:00 am',
        dateandtime: '1/13/2025',
      ),
    ]);
  }
}
