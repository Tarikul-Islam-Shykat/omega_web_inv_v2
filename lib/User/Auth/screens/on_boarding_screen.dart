
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth/screens/login_screen.dart';
import 'package:omega_web_inv/splash_screen/controller/on_boarding_controller.dart';

import '../../../../core/global_widegts/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    final List<Map<String, String>> onboardingData = [
      {
        'image': 'assets/images/image1.png',
        'title': 'Looking for something?',
        'description': 'Don’t lose time driving, calling,\nsearching...',
      },
      {
        'image': 'assets/images/image2.png',
        'title': 'Just ask.',
        'description': 'Let the GotInfo community help.',
      },
      {
        'image': 'assets/images/image3.png',
        'title': 'Find what you need.',
        'description': 'Access items and services quickly and conveniently.',
      },
      {
        'image': 'assets/images/image4.png',
        'title': 'Resume your joy.',
        'description': 'Use GotInfo to get back to doing what you enjoy.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    onboardingData[index]['image']!,
                    height: 262.h,
                    width: 343.w,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              height: 79.h,
                              width: 71.w,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboardingData[index]['title']!,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2F2F2F),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboardingData[index]['description']!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFFACACAC),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Back button (you can add actual back logic if needed)
          Positioned(
            top: 40,
            left: 20,
            child: CircleAvatar(
              backgroundColor: const Color(0xFFEFEFFE),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),

          // Skip button
          Positioned(
            top: 40,
            right: 20,
            child: Obx(
              () =>
                  controller.currentPage.value != 3
                      ? TextButton(
                        onPressed: controller.skip,
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xFFACACAC),
                            fontSize: 16,
                          ),
                        ),
                      )
                      : const SizedBox(),
            ),
          ),

          // Dot indicators + Next button
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Obx(() {
              if (controller.isLastPage) {
                return const SizedBox.shrink();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dot Indicators
                    Row(
                      children: List.generate(
                        onboardingData.length - 1,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          height: 8.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                            color:
                                controller.currentPage.value == index
                                    ? const Color(0xFFA16DB6)
                                    : const Color(0xFFB8B8B8),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    // Next Button
                    CircleAvatar(
                      backgroundColor: const Color(0xFFA16DB6),
                      child: GestureDetector(
                        onTap: controller.nextPage,
                        child: const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

          // Let's Get Started Button
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Obx(
              () =>
                  controller.isLastPage
                      ? CustomButton(
                        text: "Let's Get Started",
                        // onPressed: controller.getStarted,
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                      )
                      : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }
}
