// controllers/progress_controller.dart
import '../model/body_measurements.dart';
import '../model/progress_data.dart';
import '../model/workouts_sessions.dart';

class AdminProgressController {
  AdminSideProgressData getProgressData() {
    return AdminSideProgressData(
      weight: 72.24,
      weightDate: DateTime(2023, 5, 4),
      weightComparison: "4 May : 79 o",
      measurements:
          AdminBodyMeasurements(chest: 95, waist: 80, hips: 95, arms: 80),
      workoutHistory: [
        AdminWorkoutSession(
          name: "Barbell Squat",
          isCompleted: true,
          timeSpent: 25,
          caloriesBurned: 300,
          imageUrl: 'assets/images/wout2.png',
        ),
        AdminWorkoutSession(
          name: "Mountain Climbers",
          isCompleted: true,
          timeSpent: 30,
          caloriesBurned: 600,
          imageUrl: 'assets/images/wout1.png',
        ),
        AdminWorkoutSession(
          name: "Pushups",
          isCompleted: true,
          timeSpent: 20,
          caloriesBurned: 200,
          imageUrl: 'assets/images/wout3.png',
        ),
      ],
      todayUpdate: "",
    );
  }
}
