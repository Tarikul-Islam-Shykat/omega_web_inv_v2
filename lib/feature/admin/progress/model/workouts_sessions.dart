class AdminWorkoutSession {
  final String name;
  final bool isCompleted;
  final int timeSpent;
  final int caloriesBurned;
  final String imageUrl;
  final String frequency;

  AdminWorkoutSession({
    required this.name,
    required this.isCompleted,
    required this.timeSpent,
    required this.caloriesBurned,
    this.imageUrl = 'assets/images/wout2.png',
    this.frequency = 'Weekly',
  });
}
