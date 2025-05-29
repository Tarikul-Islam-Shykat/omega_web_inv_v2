import 'package:omega_web_inv/User/Auth_Screen/screens/Progress/model/body_measurements.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Progress/model/workouts_sessions.dart';

class ProgressData {
  final double weight;
  final DateTime weightDate;
  final String weightComparison;
  final BodyMeasurements measurements;
  final List<WorkoutSession> workoutHistory;
  final String todayUpdate;

  ProgressData({
    required this.weight,
    required this.weightDate,
    required this.weightComparison,
    required this.measurements,
    required this.workoutHistory,
    required this.todayUpdate,
  });
}
