import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/global_widegts/app_network_image.dart';
import '../../chat/chatbox/chat_message.dart';
import '../../home/controller/workout_plan_controller.dart';
import '../../home/widgets/exercise_library.dart';
import '../../home/widgets/video_card_widget.dart';
import '../widget/card_widget.dart';

class WorkoutPage extends StatelessWidget {
  final WorkoutPlanController controller = Get.put(WorkoutPlanController());



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
              //dash board
              goalCard(name: "Workout Goals",cal: "540"),
              SizedBox(height: 10.h,),
              goalCard(name: "Selected Workout",cal: "320"),

              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggest Exercise',
                      style: TextStyle(
                          color: Color(0xFFF5838C), fontSize: 20.sp),
                    ),
                    GestureDetector(
                      onTap: () {},
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
              //workout list
              ListView.builder(
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xFFFFFFFF).withAlpha(18),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //title
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  ResponsiveNetworkImage(
                                    imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFU7U2h0umyF0P6E_yhTX45sGgPEQAbGaJ4g&s",
                                    heightPercent: .05,
                                    widthPercent: .1,),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Barbell squat",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 3.h),
                                      Text("Lose Weight ",
                                        style: TextStyle(
                                            color: Color(0xFFCCCBCB),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// Suggest Library Title Row
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
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
                                      Get.to(() => ExerciseLibrary());
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          'See all',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            decoration: TextDecoration
                                                .underline,
                                          ),
                                        ),
                                        Icon(Icons.arrow_right,
                                            color: Colors.white),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10.h),

                            /// 2 Row Items
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: WorkoutVideoCard(
                                      videoUrl: "https://nyc3.digitaloceanspaces.com/smtech-space/nathancloud/1749632725134_15d25a3d-aacf-4053-ae15-c0471c9a704b_Frame 1321315490.png",
                                      time: "12:00",
                                      kcal: "120",
                                    ),
                                  ),
                                  Flexible(
                                    child: WorkoutVideoCard(
                                      videoUrl: "https://nyc3.digitaloceanspaces.com/smtech-space/nathancloud/1749632725134_15d25a3d-aacf-4053-ae15-c0471c9a704b_Frame 1321315490.png",
                                      time: "12:00",
                                      kcal: "120",
                                    ),
                                  ),

                                ],
                              ),
                            ),


                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                    );
                  }),
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

}