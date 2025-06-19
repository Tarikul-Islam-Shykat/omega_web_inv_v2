// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



import '../../../core/global_widegts/app_network_image.dart';
import '../chat/chatbox/chat_message.dart';
import '../home/controller/goal_controller.dart';
import '../home/controller/workout_plan_controller.dart';
import 'model/workout_model.dart';

class WorkoutPage extends StatelessWidget {
  final WorkoutPlanController controller = Get.put(WorkoutPlanController());
  final GoalController goalController = Get.find();



  WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // _goalCard(sw),
              // SizedBox(height: 20.h),
              // _selectWorkoutCard(sw),
              // SizedBox(height: 20.h),
              // CustomDropdownWithFilter(workouts: [], sw: 0.0,),
              // SizedBox(height: 20.h),

              //Your Trainer
              Padding(
                padding: EdgeInsets.all(16.w),
                child: SizedBox(
                  width: sw * 0.95,
                  height: 40.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      backgroundColor: Colors.redAccent,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Get.to(() => ChatDetailScreen(contactName: 'Trainer'));
                    },
                    child: Text(
                      'Your Trainer',
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goalCard(double sw) {
    final GoalController goalController = Get.find();

    return Obx(
      () => _buildCard(
        sw,
        'Workout Goals',
        // '${controller.remainingCalories.value}',
        goalController.caloriesBurned.value.split(' ')[0],
      ),
    );
  }

  Widget _selectWorkoutCard(double sw) {
    return  _buildCard(
        sw,
        'Select Workout',
        '129',
      );
  }

  Widget _buildCard(double sw, String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        height: 60.h,
        width: sw * 0.95,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(18),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$title ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: Color(0xFFFB4958),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Kcal',
                  style: TextStyle(
                    color: Color(0xFFFB4958),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropdownWithFilter extends StatefulWidget {
  final List workouts;
  final double sw;

  const CustomDropdownWithFilter({
    super.key,
    required this.workouts,
    required this.sw,
  });

  @override
  State<CustomDropdownWithFilter> createState() =>
      _CustomDropdownWithFilterState();
}

class _CustomDropdownWithFilterState extends State<CustomDropdownWithFilter> {
  bool _isDropdownOpen = false;
  final List<String> _options = [
    'Barbell Squat',
    'Mountain Climbers',
    'Pushups',
    'Other',
  ];
  final List<bool> _selectedOptions = [false, false, false, false];

  final Set<int> _selectedIndices = {}; // Track multiple selected indices
  final WorkoutPlanController controller = Get.find();


  // void _toggleDropdown() {
  //   setState(() {
  //     _isDropdownOpen = !_isDropdownOpen;
  //   });
  // }
  //
  // void _toggleOption(int index) {
  //   setState(() {
  //     _selectedOptions[index] = !_selectedOptions[index];
  //     _filterWorkouts();
  //   });
  // }
  //
  // void _filterWorkouts() {
  //   List<String> selectedTitles = [];
  //   for (int i = 0; i < _selectedOptions.length; i++) {
  //     if (_selectedOptions[i]) {
  //       selectedTitles.add(_options[i]);
  //     }
  //   }
  //
  //   if (selectedTitles.isEmpty) {
  //     _filteredWorkouts = widget.workouts;
  //   } else {
  //     _filteredWorkouts =
  //         widget.workouts.where((workout) {
  //           return selectedTitles.contains(workout.title) ||
  //               (selectedTitles.contains('Other') &&
  //                   !_options.sublist(0, 3).contains(workout.title));
  //         }).toList();
  //   }
  // }
  //
  // void _toggleSelection(int index) {
  //   setState(() {
  //     if (_selectedIndices.contains(index)) {
  //       _selectedIndices.remove(index);
  //       controller.remainingCalories.value -= int.parse(
  //         _filteredWorkouts[index].kcal,
  //       );
  //     } else {
  //       _selectedIndices.add(index);
  //       controller.remainingCalories.value += int.parse(
  //         _filteredWorkouts[index].kcal,
  //       );
  //     }
  //   });
  // }

  Widget _exerciseCard() {
    final isSelected = _selectedIndices.contains(1);

    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white.withAlpha(18),
            border:
                isSelected
                    ? Border.all(color: Colors.redAccent, width: 2)
                    : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  children: [
                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s",
                      width: 60.w,
                      height: 60.h,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("exercise.title",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text("exercise.category",
                          style: TextStyle(
                            color: Color(0xFFCCCBCB),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggest Exercise Library',
                      style: TextStyle(
                        color: Color(0xFFF5838C),
                        fontSize: 12.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        log('See all tapped');
                        // Get.to(() => ExerciseLibrary());
                      },
                      child: Row(
                        children: [
                          Text(
                            'See all',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Icon(Icons.arrow_right, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: _libraryItem()),
                    SizedBox(width: 10.w),
                    Flexible(child: _libraryItem()),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _libraryItem() {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.white.withAlpha(18),
                child: Image.asset(
                  'assets/images/pause.png',
                  width: 10.w,
                  height: 10.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(30),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: FittedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.timer, size: 14.sp, color: Colors.white),
                      SizedBox(width: 4.w),
                      Text("workout.time",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.local_fire_department,
                        size: 14.sp,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4.w),
                      Text("workout.kcal",
                        style: TextStyle(color: Colors.white, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [

            //Suggest Exercise filter
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggest Exercise',
                    style: TextStyle(color: Color(0xFFF5838C), fontSize: 20.sp),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Image.asset(
                          'assets/images/filter.png',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: _filteredWorkouts.length,
            //   itemBuilder: (context, index) {
            //     final exercise = _filteredWorkouts[index];
            //     return Padding(
            //       padding: EdgeInsets.only(bottom: 12.h),
            //       child: _exerciseCard(exercise: exercise, index: index),
            //     );
            //   },
            // ),
          ],
        ),
        if (_isDropdownOpen)
          Positioned(
            right: 16.w,
            top: 30.h,
            child: Container(
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fitness Goal',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Transform.rotate(
                          angle: 4.71,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...List.generate(_options.length, (index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(18),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: _selectedOptions[index],
                                onChanged: (value) {},
                                activeColor: Colors.transparent,
                                checkColor: Colors.white,
                                side: BorderSide(color: Colors.white),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                              Flexible(
                                // Prevent text overflow
                                child: Text(
                                  _options[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {


  const WorkoutCard({super.key,});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Container(
      height: 214.h,
      width: sw * 0.9,
      color: Colors.white.withAlpha(18),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ResponsiveNetworkImage(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s',heightPercent: .05,),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Title",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("workout.category",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
