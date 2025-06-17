
import 'package:omega_web_inv/feature/admin/progress/model/workouts_sessions.dart';
import 'body_measurements.dart';

class AdminSideProgressData {
  final double weight;
  final DateTime weightDate;
  final String weightComparison;
  final AdminBodyMeasurements measurements;
  final List<AdminWorkoutSession> workoutHistory;
  final String todayUpdate;

  AdminSideProgressData({
    required this.weight,
    required this.weightDate,
    required this.weightComparison,
    required this.measurements,
    required this.workoutHistory,
    required this.todayUpdate,
  });
}
