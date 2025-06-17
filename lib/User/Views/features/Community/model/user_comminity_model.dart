class PostModel {
  final String id;
  final String userName;
  final String date;
  final String content;
  final String profileImage;
  final String? imageUrl;

  PostModel({
    required this.id,
    required this.userName,
    required this.date,
    required this.content,
    required this.profileImage,
    this.imageUrl,
  });
}

class Comment {
  final String username;
  final String text;
  final String avatar;
  final String time;

  Comment({
    required this.username,
    required this.text,
    required this.avatar,
    required this.time,
  });
}
