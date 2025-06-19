
class WorkOutPlanModel {
  final String? id;
  late final bool? isCompleted;
  final Workout? workout;

  WorkOutPlanModel({
    this.id,
    this.isCompleted,
    this.workout,
  });

  factory WorkOutPlanModel.fromJson(Map<String, dynamic> json) => WorkOutPlanModel(
    id: json["id"],
    isCompleted: json["isCompleted"],
    workout: json["workout"] == null ? null : Workout.fromJson(json["workout"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isCompleted": isCompleted,
    "workout": workout?.toJson(),
  };
}

class Workout {
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

  Workout({
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

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
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
