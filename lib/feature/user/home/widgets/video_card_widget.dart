import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/const/image_path.dart';
import '../../../../core/global_widegts/app_network_image.dart';
import '../../../../core/repository/services_class/video_controller.dart';


class WorkoutVideoCard extends StatelessWidget {
  final String videoUrl;
  final String time;
  final String kcal;
  final bool isIcon;

  const WorkoutVideoCard({
    super.key,
    required this.videoUrl,
    required this.time,
    required this.kcal,
    this.isIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final VideoController controller =
    Get.put(VideoController(videoUrl: videoUrl), tag: videoUrl);

    return Obx(() {
      return Container(
        width: 135.w,
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            controller.isInitialized.value ? Container(
              height: 90.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white10),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: AspectRatio(
                    aspectRatio: controller.videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(controller.videoPlayerController),
                                ),
                              ),
                )
                : Center(child: CircularProgressIndicator()),

            /// Play/Pause Button
            GestureDetector(
              onTap: controller.togglePlayPause,
              child: CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF).withAlpha(30),
                radius: 15.r,
                child: Icon(
                  controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),

            /// Info at bottom
            Positioned(
              bottom: 1,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF).withAlpha(30),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    child: Row(
                      children: [
                         isIcon?Icon(Icons.timer, size: 14.sp, color: Colors.white):Center(),

                        SizedBox(width: 4.w),
                        Text(
                          time,
                          style: TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                        SizedBox(width: 6.w),
                        Container(
                          height: 10,
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.white,
                                width: 1.5,

                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Image.asset(ImagePath.energy,height:12.sp ,color: Colors.white,),
                        SizedBox(width: 4.w),
                        Text(
                          kcal,
                          style: TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}


Widget nutritionCard({
  required String image,
  required String cgm,
  required String cal,
}){
  return Container(
    width: 135.w,
    height: 90.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 90.h,
          width: 150.w,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white10),
              borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:ResponsiveNetworkImage(imageUrl:image,widthPercent:.4,heightPercent: .09,),
          ),
        ),

        /// Info at bottom
        Positioned(
          bottom: 1,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withAlpha(30),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Row(
                  children: [



                    Text(
                      cgm,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      height: 10,
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.white,
                            width: 1.5,

                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Image.asset(ImagePath.energy,height:12.sp ,color: Colors.white,),
                    SizedBox(width: 4.w),
                    Text(
                      cal,
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}