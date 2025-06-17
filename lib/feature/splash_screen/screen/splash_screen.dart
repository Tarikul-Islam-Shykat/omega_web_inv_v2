// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/splash_screen_controller.dart';
import '../controller/swipe_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 40.h),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Image.asset(
                      'assets/images/splash_text.png',
                      fit: BoxFit.contain,
                      height: 50.h,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Image.asset(
                    'assets/images/splash1.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 40.h,
              left: 20.w,
              right: 20.w,
              child: const SwipeToExplore(),
            ),
          ],
        ),
      ),
    );
  }
}

class SwipeToExplore extends StatelessWidget {
  const SwipeToExplore({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(SwipeController());
    controller.initializeMaxDrag(screenWidth);

    return Container(
      width: screenWidth * 0.9,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.18),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(0.26),
              highlightColor: Colors.grey.shade300,
              child: Text(
                'Swipe to explore',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
              left: controller.dragOffset.value,
              top: 3.h,
              right: 265.w,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onHorizontalDragUpdate: (details) {
                  controller.updateDrag(details.primaryDelta ?? 0.0);
                },
                onHorizontalDragEnd: (_) {
                  controller.handleDragEnd(() {
                    Get.find<SplashScreenController>().goToNextScreen();
                  });
                },
                child: Container(
                  width: 40.w,
                  height: 36.h,
                  decoration: BoxDecoration(
                    color:
                        controller.dragOffset.value >= controller.maxDrag.value
                            ? Colors.green
                            : const Color(0xFFFB4958),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child:
                          controller.dragOffset.value >=
                                  controller.maxDrag.value
                              ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                key: ValueKey('check'),
                              )
                              : const Icon(
                                Icons.double_arrow,
                                color: Colors.white,
                                key: ValueKey('arrow'),
                              ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 6.w,
            top: -3.h,
            child: Container(
              width: 45.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.check, color: Colors.white),
              ),
            ),
          ),
          Obx(
            () => Positioned(
              left: 10.w,
              right: 10.w,
              bottom: 5.h,
              child: LinearProgressIndicator(
                value: controller.dragOffset.value / controller.maxDrag.value,
                backgroundColor: Colors.transparent,
                color: Colors.transparent,
                minHeight: 2.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
