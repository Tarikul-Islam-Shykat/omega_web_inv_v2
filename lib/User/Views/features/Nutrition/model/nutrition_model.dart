class NutritionModel {
  final String quantity;
  final String kcal;
  final String title;
  final String thumbnailUrl;
  final int calories;
  final String imagePath;
  final String centerImagePath;

  NutritionModel({
    required this.quantity,
    required this.kcal,
    required this.title,
    required this.thumbnailUrl,
    required this.calories,
    required this.imagePath,
    required this.centerImagePath,
  });
}
