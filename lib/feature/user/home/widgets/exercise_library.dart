// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omega_web_inv/core/const/app_loader.dart';
import 'package:omega_web_inv/core/global_widegts/custom_app_bar.dart';
import 'package:omega_web_inv/feature/user/home/widgets/video_card_widget.dart';
import 'package:omega_web_inv/feature/user/workouts/controller/workout_controller.dart';

import '../../../../core/global_widegts/app_network_image.dart';

class ExerciseLibrary extends StatelessWidget {
   ExerciseLibrary({super.key});
  final AllWorkoutController workoutController = Get.find<AllWorkoutController>();

  @override
  Widget build(BuildContext context) {
    // List of exercises (each appears twice, just like in the photo)
    // final List<Map<String, String>> exercises = [
    //   {
    //     "title": "Barbell squat",
    //     'thumbnailUrl': 'assets/images/user.png',
    //     'imagePath': 'assets/images/wout1.png',
    //     "category": "Loss weight",
    //     'centerImagePath': 'assets/images/pause.png',
    //   },
    //   {
    //     "title": "Barbell squat",
    //     'thumbnailUrl': 'assets/images/user.png',
    //     'imagePath': 'assets/images/wout2.png',
    //     "category": "Loss weight",
    //     'centerImagePath': 'assets/images/pause.png',
    //   },
    //   {
    //     "title": "Mountain Climbers",
    //     'thumbnailUrl': 'assets/images/user.png',
    //     'imagePath': 'assets/images/wout3.png',
    //     "category": "Build Muscle",
    //     'centerImagePath': 'assets/images/pause.png',
    //   },
    //   {
    //     "title": "Mountain Climbers",
    //     'thumbnailUrl': 'assets/images/user.png',
    //     'imagePath': 'assets/images/wout4.png',
    //     "category": "Build Muscle",
    //     'centerImagePath': 'assets/images/pause.png',
    //   },
    //   {
    //     "title": "Pushups",
    //     'thumbnailUrl': 'assets/images/user.png',
    //     'imagePath': 'assets/images/wout3.png',
    //     "category": "Stay Healthy",
    //     'centerImagePath': 'assets/images/pause.png',
    //   },
    //   {
    //     "title": "Pushups",
    //     'thumbnailUrl': 'assets/images/user.png',
    //     'imagePath': 'assets/images/wout4.png',
    //     "category": "Stay Healthy",
    //     'centerImagePath': 'assets/images/pause.png',
    //   },
    // ];

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar:
      body: Obx((){
        if(workoutController.isLoadingWorkout.value){
          return Center(child: loader(),);
        }else{
          return Column(
            children: [
              CustomAppBar(title: 'Exercise Library', centerTitle: true),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                    top: 0,
                    bottom: 0,
                  ),
                  child: ListView.builder(
                    itemCount: workoutController.allWorkout.length,
                    itemBuilder: (context, index) {
                      final data = workoutController.allWorkout[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title Row (Icon + Text)
                            Row(
                              children: [
                                Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.r),
                                      child: ResponsiveNetworkImage(imageUrl: "${data.icon}",)),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${data.title}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text("${data.fitnessGoal}",
                                      style: TextStyle(
                                        color: const Color(0xFFCCCBCB),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              height: 120.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.grey[900],
                              ),
                              child: Stack(
                                children: [
                                  WorkoutVideoCard(
                                    height:120.h ,
                                    width: double.infinity,
                                    widthTime: 100,
                                    videoUrl: "${data.video}",
                                    time: "${data.duration}",
                                    kcal: "${data.kcal}",
                                  ),
                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(12.r),
                                  //   child: Image.asset(
                                  //     exercises[index]["imagePath"]!,
                                  //     width: double.infinity,
                                  //     fit: BoxFit.cover,
                                  //   ),
                                  // ),
                                  // Positioned(
                                  //   bottom: 10.h,
                                  //   left: 0,
                                  //   right: 0,
                                  //   child: Center(
                                  //     child: Column(
                                  //       children: [
                                  //         CircleAvatar(
                                  //           backgroundColor: Colors.white.withAlpha(
                                  //             18,
                                  //           ),
                                  //           child: Image.asset(
                                  //             exercises[index]["centerImagePath"]!,
                                  //             height: 15.h,
                                  //             width: 15.w,
                                  //           ),
                                  //         ),
                                  //         SizedBox(height: 15.h),
                                  //         Container(
                                  //           width: 193.w,
                                  //           padding: EdgeInsets.symmetric(
                                  //             horizontal: 12.w,
                                  //             vertical: 2.h,
                                  //           ),
                                  //           decoration: BoxDecoration(
                                  //             color: Colors.white.withOpacity(0.1),
                                  //             borderRadius: BorderRadius.circular(
                                  //               20.r,
                                  //             ),
                                  //           ),
                                  //           child: Row(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Row(
                                  //                 children: [
                                  //                   Icon(
                                  //                     Icons.timer,
                                  //                     size: 14.sp,
                                  //                     color: Colors.white,
                                  //                   ),
                                  //                   SizedBox(width: 4.w),
                                  //                   Text(
                                  //                     '10:00',
                                  //                     style: TextStyle(
                                  //                       color: Colors.white,
                                  //                       fontSize: 12.sp,
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //               Row(
                                  //                 children: [
                                  //                   Icon(
                                  //                     Icons.local_fire_department,
                                  //                     size: 14.sp,
                                  //                     color: Colors.white,
                                  //                   ),
                                  //
                                  //                   SizedBox(width: 4.w),
                                  //                   Text(
                                  //                     '100 kcal',
                                  //                     style: TextStyle(
                                  //                       color: Colors.white,
                                  //                       fontSize: 12.sp,
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }

        }
      ),
    );
  }
}
