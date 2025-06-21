import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/core/const/app_loader.dart';
import 'package:omega_web_inv/feature/user/workouts/controller/fitness_name_controller.dart';
import 'package:omega_web_inv/feature/user/workouts/controller/workout_controller.dart';
import '../../../../core/global_widegts/app_network_image.dart';
import '../../chat/chatbox/chat_message.dart';
import '../../home/widgets/exercise_library.dart';
import '../../home/widgets/video_card_widget.dart';
import '../widget/card_widget.dart';
import 'multiple_select_dropdown.dart';

class WorkoutPage extends StatelessWidget {
  final AllWorkoutController controller = Get.put(AllWorkoutController());
  final FitnessNameController fitnessController = Get.put(FitnessNameController());



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
              Obx((){
                  return goalCard(name: "Selected Workout",cal:"${controller.selectKcal}");
                }
              ),

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
                      onTap: () {

                        fitnessController.toggleDropdown();

                      },
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

              //filter fitness name
              FitnessFilterDropdown(),
              //workout list
              Obx((){
                if(controller.isLoadingWorkout.value){
                  return Center(child: loader(),);
                }else if(controller.allWorkout.isEmpty){
                  return Center(child: Text("No Data Found"),);
                }else{
                  return ListView.builder(
                      itemCount:  controller.filteredWorkout.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = controller.filteredWorkout[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.h),
                          child: GestureDetector(
                            onTap: ()=>controller.onSelectWorkoutKcal(data),
                            child: Obx((){
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: const Color(0xFFFFFFFF).withAlpha(18),
                                    border:Border.all(color:controller.selectedWorkouts.contains(data)?Color(0xFFFB4958):Colors.transparent),
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
                                              imageUrl: "${data.icon}",
                                              heightPercent: .05,
                                              widthPercent: .1,),
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
                                                SizedBox(height: 3.h),
                                                Text("${data.fitnessGoal}",
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
                                                videoUrl: "${data.video}",
                                                time: "${data.duration}",
                                                kcal: "${data.kcal}",
                                              ),
                                            ),
                                            Flexible(
                                              child: WorkoutVideoCard(
                                                videoUrl: "${data.video}",
                                                time: "${data.duration}",
                                                kcal: "${data.kcal}",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                    ],
                                  ),
                                );
                              }
                            ),
                          ),
                        );
                      });
                }

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

  void showFilterDialog(BuildContext context, FitnessNameController fitnessController, AllWorkoutController workoutController) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10),
            Text("Fitness Goal", style: TextStyle(color: Colors.white, fontSize: 18)),
            ...fitnessController.fitnessNameModel.map((fitness) {
              final isSelected = fitnessController.selectedFitnessNames.contains(fitness.title);
              return CheckboxListTile(
                activeColor: Colors.redAccent,
                value: isSelected,
                title: Text(fitness.title.toString(), style: TextStyle(color: Colors.white)),
                onChanged: (_) {
                  fitnessController.toggleSelection(fitness.title.toString());
                  workoutController.applyFilter(fitnessController.selectedFitnessNames);
                },
              );
            }),
            SizedBox(height: 10),
          ],
        ));
      },
    );
  }




}