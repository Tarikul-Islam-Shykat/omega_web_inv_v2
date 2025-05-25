// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/splash_screen/controller/swipe_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../controller/splash_screen_controller.dart';

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
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/splash_text.png',
                      fit: BoxFit.cover,
                      height: 50.h,
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    child: Image.asset(
                      'assets/images/splash1.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: const SwipeToExplore(),
            ),
            SizedBox(height: 30.h),
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
    final controller = Get.put(SwipeController());

    return Positioned(
      bottom: 30.h,
      left: 20,
      right: 20,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          controller.updateDrag(details.primaryDelta ?? 0.0);
        },
        onHorizontalDragEnd: (_) {
          controller.handleDragEnd(() {
            Get.find<SplashScreenController>().goToNextScreen();
          });
        },
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF).withValues(alpha: 0.26),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Center(
                child: Shimmer.fromColors(
                  baseColor: Color(0xFFFFFFFF).withValues(alpha: 0.26),
                  highlightColor: Colors.grey.shade300,
                  child: const Text(
                    'Swipe to explore',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Positioned(
                  left: -5,
                  top: 3,
                  child: Transform.translate(
                    offset: Offset(controller.dragOffset.value, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFB4958),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.double_arrow, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -5,
                top: 3,

                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
