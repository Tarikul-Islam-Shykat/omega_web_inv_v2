import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omega_web_inv/core/const/app_loader.dart';
import 'package:omega_web_inv/core/global_widegts/custom_app_bar.dart';
import '../../../../core/global_widegts/app_network_image.dart';
import '../controller/workout_plan_controller.dart';
import '../widgets/video_card_widget.dart';

class WorkoutPlan extends StatelessWidget {
  WorkoutPlan({super.key});

  final WorkoutPlanController controller = Get.put(WorkoutPlanController());

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(title: 'Workout Plans', centerTitle: true),
            SizedBox(height: 8.h),
            Obx((){
                return Container(
                  height: 60.h,
                  width: sw * 0.95,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF).withAlpha(18),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child:Text(
                      '${controller.totalBurnedCalories.value} Kcal',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFFB4958),
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    )

                  ),
                );
              }
            ),

            /// ListView.builder for exercise cards
            Obx(() {
              if (controller.isGetWorkOut.value) {
                return Center(child: loader());
              } else if (controller.workOutPlan.isEmpty) {
                return Center(
                  child: Text(
                    "No Data Found",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.workOutPlan.length,
                  itemBuilder: (context, index) {
                    final data = controller.workOutPlan[index].workout;
                    return Padding(
                      padding: EdgeInsets.only(bottom: 12.h),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                                  horizontal: 20.w,
                                  vertical: 10.h,
                                ),
                                child: Row(
                                  children: [
                                    ResponsiveNetworkImage(
                                      imageUrl: data!.icon.toString(),
                                      heightPercent: .04.h,
                                      widthPercent: .12.w,
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Text(
                                        data.title.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// Suggest Library Title Row
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Suggest Exercise Library',
                                      style: TextStyle(
                                        color: const Color(0xFFF5838C),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'See all',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          decoration: TextDecoration.underline,
                                        ),
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
                                        videoUrl: data.video.toString(),
                                        time: data.duration.toString(),
                                        kcal: data.kcal.toString(),
                                      ),
                                    ),
                                    Flexible(
                                      child: WorkoutVideoCard(
                                        videoUrl: data.video.toString(),
                                        time: data.duration.toString(),
                                        kcal: data.kcal.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 12.h),

                              Obx(() {
                                return controller
                                        .workOutPlan[index]
                                        .isCompleted!
                                    ? Center()
                                    : Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      child: SizedBox(
                                        width: 160.w,
                                        height: 35.h,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            controller.workoutCompleted(
                                              data.id.toString(),
                                              int.parse(data.kcal.toString()),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFFD9D9D9),
                                            foregroundColor: Color(0xFF636363),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                          ),
                                          child: Text(
                                            'Complete',
                                            style: TextStyle(fontSize: 16.sp),
                                          ),
                                        ),
                                      ),
                                    );
                              }),

                              SizedBox(height: 16.h),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }),

            SizedBox(height: 20.h),
            SizedBox(
              width: sw * 0.9,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  log("Trainer button pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFB4958),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text('Your Trainer', style: TextStyle(fontSize: 16.sp)),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
