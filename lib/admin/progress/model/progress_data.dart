

import 'package:omega_web_inv/admin/progress/model/body_measurements.dart';
import 'package:omega_web_inv/admin/progress/model/workouts_sessions.dart';

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
