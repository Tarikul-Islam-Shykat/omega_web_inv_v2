import 'package:get/get.dart';
import 'package:omega_web_inv/User/Views/features/Notification/model/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Sample data based on the image
    notifications.add(
      NotificationModel(
        title: "Notification",
        message:
            "signed up using your referral code — you’ve earned 1 month of free Premium Subscription!",
        senderName: "Devon Lane",
        time: "12:03 am",
        profileImage: "assets/images/user3.png",
      ),
    );
  }

  void addNotification(NotificationModel notification) {
    notifications.add(notification);
    notifications.refresh();
  }
}
