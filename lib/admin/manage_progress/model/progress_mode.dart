class UserProgress {
  final String id;
  final String name;
  final String profileImage;
  final String progressStatus;
  final double progressPercentage;
  final bool isProgressUp;

  UserProgress({
    required this.id,
    required this.name,
    required this.profileImage,
    required this.progressStatus,
    required this.progressPercentage,
    required this.isProgressUp,
  });

  UserProgress copyWith({
    String? id,
    String? name,
    String? profileImage,
    String? progressStatus,
    double? progressPercentage,
    bool? isProgressUp,
  }) {
    return UserProgress(
      id: id ?? this.id,
      name: name ?? this.name,
      profileImage: profileImage ?? this.profileImage,
      progressStatus: progressStatus ?? this.progressStatus,
      progressPercentage: progressPercentage ?? this.progressPercentage,
      isProgressUp: isProgressUp ?? this.isProgressUp,
    );
  }
}