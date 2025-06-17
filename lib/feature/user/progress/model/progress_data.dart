
import 'package:omega_web_inv/feature/user/progress/model/workouts_sessions.dart';
import 'body_measurements.dart';

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
