class User {
  final String id;
  final String name;
  final String imagePath;
  final UserType userType;
  final bool isPaid;

  User({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.userType,
    required this.isPaid,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      imagePath: json['imagePath'] ?? '',
      userType: UserType.values.firstWhere(
        (type) => type.toString() == 'UserType.${json['userType']}',
        orElse: () => UserType.all,
      ),
      isPaid: json['isPaid'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'userType': userType.toString().split('.').last,
      'isPaid': isPaid,
    };
  }
}

enum UserType {
  all,
  paid,
  nonPaid,
}

extension UserTypeExtension on UserType {
  String get displayName {
    switch (this) {
      case UserType.all:
        return 'All User';
      case UserType.paid:
        return 'Paid User';
      case UserType.nonPaid:
        return 'Nonpaid User';
    }
  }
}