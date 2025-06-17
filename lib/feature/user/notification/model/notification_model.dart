class NotificationModel {
  final String title;
  final String message;
  final String senderName;
  final String time;
  final String profileImage;

  NotificationModel({
    required this.title,
    required this.message,
    required this.senderName,
    required this.time,
    required this.profileImage,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      message: json['message'],
      senderName: json['senderName'],
      time: json['time'],
      profileImage: json['profileImage'],
    );
  }
}
