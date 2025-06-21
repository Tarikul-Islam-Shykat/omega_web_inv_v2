

class AllFitnessNameModel {
  final String? id;
  final String? title;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AllFitnessNameModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  factory AllFitnessNameModel.fromJson(Map<String, dynamic> json) => AllFitnessNameModel(
    id: json["id"],
    title: json["title"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
