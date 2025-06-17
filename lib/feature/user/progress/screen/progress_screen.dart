// screens/progress_screen.dart
// ignore_for_file: unnecessary_to_list_in_spreads

import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/global_widegts/custom_button.dart';
import '../../home/controller/custom_dropdown_controller.dart';
import '../controller/progress_controller.dart';
import '../model/progress_data.dart';
import '../model/workouts_sessions.dart';
import '../widget/custom_update_dialog.dart';

class ProgressScreen extends StatelessWidget {
  final ProgressController _controller = ProgressController();

  ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProgressData data = _controller.getProgressData();

    final unitController = Get.put(CustomDropDownController());
    unitController.initializeItems(['cm', 'in', 'kg', 'lb'], 'cm');

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(18),
                  borderRadius: BorderRadius.circular(10.w),
                ),
                height: 50.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'progress & Analytics',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                      GestureDetector(
                        onTap: () {
                          log('tapped');
                        },
                        child: Row(
                          children: [
                            Text(
                              'Week',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Icon(Icons.arrow_right_sharp, color: Colors.white),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Weight progress',
                style: TextStyle(color: Color(0xFFF5838C), fontSize: 20.sp),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(18),
                  borderRadius: BorderRadius.circular(8.w),
                ),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 24.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '${data.weight} Kg',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 55.h,
                      width: 180.w,
                      child: LineChart(
                        LineChartData(
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 80),
                                FlSpot(1, 78.5),
                                FlSpot(2, 77),
                                FlSpot(3, 76),
                                FlSpot(4, 79),
                                FlSpot(5, 75),
                                FlSpot(6, 74.5),
                                FlSpot(7, 74),
                                FlSpot(8, 73),
                                FlSpot(9, 72.24),
                              ],
                              isCurved: false,
                              dotData: FlDotData(show: true),
                              color: Color(0xFFFB4958),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineTouchData: LineTouchData(
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBorderRadius: BorderRadius.circular(8),
                              fitInsideHorizontally: true,
                              fitInsideVertically: true,
                              tooltipPadding: const EdgeInsets.all(8),
                              tooltipMargin: 8,
                              getTooltipItems: (touchedSpots) {
                                return touchedSpots.map((spot) {
                                  return LineTooltipItem(
                                    '4 May - ${spot.y.toStringAsFixed(0)} Kg',
                                    const TextStyle(color: Colors.white),
                                  );
                                }).toList();
                              },
                            ),
                            handleBuiltInTouches: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Body Measurement',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF5838C),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => unitController.toggleDropdown(),
                                  child: Row(
                                    children: [
                                      Obx(
                                        () => Text(
                                          unitController
                                                  .selectedValue
                                                  .value
                                                  .isEmpty
                                              ? 'cm'
                                              : unitController
                                                  .selectedValue
                                                  .value,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 12.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Obx(
                          () =>
                              unitController.showDropdown.value
                                  ? Positioned(
                                    right: 0,
                                    top: 15.h,
                                    child: Container(
                                      height: 200.h,
                                      width: 200.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withAlpha(0),
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children:
                                            ['cm', 'in', 'kg', 'lb'].map((
                                              unit,
                                            ) {
                                              return Column(
                                                children: [
                                                  SizedBox(height: 2.h),
                                                  GestureDetector(
                                                    onTap: () {
                                                      unitController
                                                          .selectedValue
                                                          .value = unit;
                                                      unitController
                                                          .hideDropdown();
                                                    },
                                                    child: Container(
                                                      width: 180.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withAlpha(80),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10.r,
                                                            ),
                                                      ),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 8.h,
                                                            horizontal: 16.w,
                                                          ),
                                                      child: Text(
                                                        unit,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 14.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 3.h),
                                                ],
                                              );
                                            }).toList(),
                                      ),
                                    ),
                                  )
                                  : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Wrap(
                    spacing: 4.w,
                    runSpacing: 6.h,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              _buildMeasurementRow(
                                context,
                                'Chest',
                                '${data.measurements.chest} cm',
                              ),
                              _buildMeasurementRow(
                                context,
                                'Waist',
                                '${data.measurements.waist} cm',
                              ),
                            ],
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            children: [
                              _buildMeasurementRow(
                                context,
                                'Hips',
                                '${data.measurements.hips} cm',
                              ),
                              _buildMeasurementRow(
                                context,
                                'Arms',
                                '${data.measurements.arms} cm',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),
              Text(
                'Workout History',
                style: TextStyle(color: Color(0xFFF5838C), fontSize: 20.sp),
              ),
              const SizedBox(height: 8),
              ...data.workoutHistory
                  .map((session) => _buildWorkoutSession(session))
                  .toList(),

              const SizedBox(height: 24),
              CustomButton(
                height: 40.h,
                onPressed: () {
                  log("Today's Update Clicked: ");
                  Get.dialog(
                    const CustomUpdateDialog(),
                  ); // Show the custom dialog using GetX
                },
                text: "Today's Update",
                backgroundColor: Color(0xFFFB4958),
                borderRadius: 10.r,
              ),
              SizedBox(height: 90.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeasurementRow(
    BuildContext context,
    String label,
    String value,
  ) {
    final sw = MediaQuery.of(context).size.width;

    return Container(
      width: sw * 0.45,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(18),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$label : $value',
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
          GestureDetector(
            onTap: () {
              log('icon tapped=====');
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 14.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutSession(WorkoutSession session) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    session.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        session.frequency,
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                      SizedBox(width: 3.w),
                      Icon(Icons.arrow_right_sharp, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      session.imageUrl,
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (session.isCompleted)
                          Text(
                            'Completed Session',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        SizedBox(height: 10.h),
                        Text(
                          'Time Spent: ${session.timeSpent} min',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFFA9A9A9),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Calories Burned: ${session.caloriesBurned}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFFA9A9A9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
