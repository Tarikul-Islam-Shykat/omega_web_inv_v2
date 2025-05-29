// controllers/progress_controller.dart
import 'package:omega_web_inv/User/Auth_Screen/screens/Progress/model/body_measurements.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Progress/model/progress_data.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Progress/model/workouts_sessions.dart';

class ProgressController {
  ProgressData getProgressData() {
    return ProgressData(
      weight: 72.24,
      weightDate: DateTime(2023, 5, 4),
      weightComparison: "4 May : 79 o",
      measurements: BodyMeasurements(chest: 95, waist: 80, hips: 95, arms: 80),
      workoutHistory: [
        WorkoutSession(
          name: "Barbell Squat",
          isCompleted: true,
          timeSpent: 25,
          caloriesBurned: 300,
          imageUrl: 'assets/images/wout2.png',
        ),
        WorkoutSession(
          name: "Mountain Climbers",
          isCompleted: true,
          timeSpent: 30,
          caloriesBurned: 600,
          imageUrl: 'assets/images/wout1.png',
        ),
        WorkoutSession(
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
