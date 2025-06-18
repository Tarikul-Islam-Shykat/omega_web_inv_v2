

class UserInfoModel {
  final String? id;
  final String? email;
  final DateTime? birth;
  final String? phone;
  final bool? activePlan;
  final List<UserInfo>? userInfo;
  final List<WeightProgress>? weightProgress;
  final DailyGoal? dailyGoal;
  final List<BodyMeasurement>? bodyMeasurement;

  UserInfoModel({
    this.id,
    this.email,
    this.birth,
    this.phone,
    this.activePlan,
    this.userInfo,
    this.weightProgress,
    this.dailyGoal,
    this.bodyMeasurement,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
    id: json["id"],
    email: json["email"],
    birth: json["birth"] == null ? null : DateTime.parse(json["birth"]),
    phone: json["phone"],
    activePlan: json["activePlan"],
    userInfo: json["userInfo"] == null ? [] : List<UserInfo>.from(json["userInfo"]!.map((x) => UserInfo.fromJson(x))),
    weightProgress: json["weightProgress"] == null ? [] : List<WeightProgress>.from(json["weightProgress"]!.map((x) => WeightProgress.fromJson(x))),
    dailyGoal: json["dailyGoal"] == null ? null : DailyGoal.fromJson(json["dailyGoal"]),
    bodyMeasurement: json["bodyMeasurement"] == null ? [] : List<BodyMeasurement>.from(json["bodyMeasurement"]!.map((x) => BodyMeasurement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "birth": birth?.toIso8601String(),
    "phone": phone,
    "activePlan": activePlan,
    "userInfo": userInfo == null ? [] : List<dynamic>.from(userInfo!.map((x) => x.toJson())),
    "weightProgress": weightProgress == null ? [] : List<dynamic>.from(weightProgress!.map((x) => x.toJson())),
    "dailyGoal": dailyGoal?.toJson(),
    "bodyMeasurement": bodyMeasurement == null ? [] : List<dynamic>.from(bodyMeasurement!.map((x) => x.toJson())),
  };
}

class BodyMeasurement {
  final String? id;
  final String? unit;
  final int? startingChest;
  final int? presentChest;
  final int? startingWaist;
  final int? presentWaist;
  final int? startingHips;
  final int? presentHips;
  final int? startingArms;
  final int? presentArms;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  BodyMeasurement({
    this.id,
    this.unit,
    this.startingChest,
    this.presentChest,
    this.startingWaist,
    this.presentWaist,
    this.startingHips,
    this.presentHips,
    this.startingArms,
    this.presentArms,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory BodyMeasurement.fromJson(Map<String, dynamic> json) => BodyMeasurement(
    id: json["id"],
    unit: json["unit"],
    startingChest: json["startingChest"],
    presentChest: json["presentChest"],
    startingWaist: json["startingWaist"],
    presentWaist: json["presentWaist"],
    startingHips: json["startingHips"],
    presentHips: json["presentHips"],
    startingArms: json["startingArms"],
    presentArms: json["presentArms"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
    "startingChest": startingChest,
    "presentChest": presentChest,
    "startingWaist": startingWaist,
    "presentWaist": presentWaist,
    "startingHips": startingHips,
    "presentHips": presentHips,
    "startingArms": startingArms,
    "presentArms": presentArms,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "userId": userId,
  };
}

class DailyGoal {
  final int? totalPlans;
  final int? completedPlans;
  final int? caloriesBurned;
  final int? caloriesConsumed;

  DailyGoal({
    this.totalPlans,
    this.completedPlans,
    this.caloriesBurned,
    this.caloriesConsumed,
  });

  factory DailyGoal.fromJson(Map<String, dynamic> json) => DailyGoal(
    totalPlans: json["totalPlans"],
    completedPlans: json["completedPlans"],
    caloriesBurned: json["CaloriesBurned"],
    caloriesConsumed: json["CaloriesConsumed"],
  );

  Map<String, dynamic> toJson() => {
    "totalPlans": totalPlans,
    "completedPlans": completedPlans,
    "CaloriesBurned": caloriesBurned,
    "CaloriesConsumed": caloriesConsumed,
  };
}

class UserInfo {
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

  UserInfo({
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

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
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

class WeightProgress {
  final String? id;
  final double? weight;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  WeightProgress({
    this.id,
    this.weight,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory WeightProgress.fromJson(Map<String, dynamic> json) => WeightProgress(
    id: json["id"],
    weight: json["weight"]?.toDouble(),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "weight": weight,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "userId": userId,
  };
}
