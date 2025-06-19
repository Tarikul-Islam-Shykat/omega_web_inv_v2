
class GetAllWorkoutModel {
  final String? id;
  final String? icon;
  final String? title;
  final String? thumbnail;
  final String? video;
  final String? duration;
  final int? kcal;
  final String? fitnessGoal;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetAllWorkoutModel({
    this.id,
    this.icon,
    this.title,
    this.thumbnail,
    this.video,
    this.duration,
    this.kcal,
    this.fitnessGoal,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAllWorkoutModel.fromJson(Map<String, dynamic> json) => GetAllWorkoutModel(
    id: json["id"],
    icon: json["icon"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    video: json["video"],
    duration: json["duration"],
    kcal: json["Kcal"],
    fitnessGoal: json["fitnessGoal"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "icon": icon,
    "title": title,
    "thumbnail": thumbnail,
    "video": video,
    "duration": duration,
    "Kcal": kcal,
    "fitnessGoal": fitnessGoal,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

