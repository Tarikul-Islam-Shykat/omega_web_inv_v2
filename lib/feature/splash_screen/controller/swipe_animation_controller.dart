// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // For HapticFeedback
// import 'package:get/get.dart';
// import 'swipe_controller.dart';
// import 'splash_screen_controller.dart';

// class SwipeAnimationController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _slideAnimation;
//   final SwipeController swipeController = Get.find<SwipeController>();

//   // Reactive variable to trigger UI updates
//   var isAnimating = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _slideAnimation = Tween<double>(begin: 0, end: 0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//     );

//     // Listen to dragOffset changes
//     swipeController.dragOffset.listen((offset) {
//       if (!_animationController.isAnimating) {
//         _slideAnimation = Tween<double>(begin: offset, end: offset).animate(
//           CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//         );
//         update(); // Trigger UI rebuild
//       }
//     });
//   }

//   @override
//   void onClose() {
//     _animationController.dispose();
//     super.onClose();
//   }

//   Animation<double> get slideAnimation => _slideAnimation;

//   void handleDragUpdate(DragUpdateDetails details, double maxWidth) {
//     swipeController.updateDrag(details.primaryDelta ?? 0.0);
//     double progress = swipeController.dragOffset.value / maxWidth;
//     if (progress > 0.1) {
//       HapticFeedback.lightImpact(); // Subtle haptic feedback
//     }
//   }

//   void handleDragEnd(double maxWidth) {
//     double progress = swipeController.dragOffset.value / maxWidth;
//     if (progress > 0.7) {
//       // Complete the swipe
//       _animationController.forward();
//       _slideAnimation = Tween<double>(
//         begin: swipeController.dragOffset.value,
//         end: maxWidth - 60,
//       ).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//       );
//       HapticFeedback.heavyImpact(); // Stronger haptic feedback
//       isAnimating.value = true;
//       _animationController.addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           Get.find<SplashScreenController>().goToNextScreen();
//         }
//       });
//     } else {
//       // Reset to start
//       _animationController.forward();
//       _slideAnimation = Tween<double>(
//         begin: swipeController.dragOffset.value,
//         end: 0,
//       ).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
//       );
//       isAnimating.value = true;
//     }
//     update(); // Trigger UI rebuild
//   }
// }
