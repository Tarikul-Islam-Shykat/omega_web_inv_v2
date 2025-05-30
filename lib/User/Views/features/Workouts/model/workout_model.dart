class WorkoutModel {
  final String time;
  final String kcal;
  final String title;
  final String category; // e.g. "Lose Weight", "Build Muscle"
  final String thumbnailUrl;
  final int durationMinutes;
  final int calories;
  final String imagePath;
  final String centerImagePath;

  WorkoutModel({
    required this.time,
    required this.kcal,
    required this.title,
    required this.category,
    required this.thumbnailUrl,
    required this.durationMinutes,
    required this.calories,
    required this.imagePath,
    required this.centerImagePath,
  });
}
