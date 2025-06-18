
class GetMeUserModel {
  final String? id;
  final String? fullName;
  final String? image;
  final int? age;
  final String? gender;
  final double? weight;
  final int? height;
  final String? fitnessGoal;
  final String? dietaryPreference;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  GetMeUserModel({
    this.id,
    this.fullName,
    this.image,
    this.age,
    this.gender,
    this.weight,
    this.height,
    this.fitnessGoal,
    this.dietaryPreference,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory GetMeUserModel.fromJson(Map<String, dynamic> json) => GetMeUserModel(
    id: json["id"],
    fullName: json["fullName"],
    image: json["image"],
    age: json["age"],
    gender: json["gender"],
    weight: json["weight"]?.toDouble(),
    height: json["height"],
    fitnessGoal: json["fitnessGoal"],
    dietaryPreference: json["dietaryPreference"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullName": fullName,
    "image": image,
    "age": age,
    "gender": gender,
    "weight": weight,
    "height": height,
    "fitnessGoal": fitnessGoal,
    "dietaryPreference": dietaryPreference,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "userId": userId,
  };
}
