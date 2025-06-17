import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SwipeController extends GetxController with GetTickerProviderStateMixin {
  final RxDouble dragOffset = 0.0.obs;
  final RxBool isSwiped = false.obs;
  final RxDouble maxDrag = 0.0.obs;
  late AnimationController _animationController;

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  void initializeMaxDrag(double screenWidth) {
    maxDrag.value = screenWidth * 0.9 - 70.w;
  }

  void updateDrag(double delta) {
    if (!isSwiped.value) {
      final newOffset = (dragOffset.value + delta).clamp(0.0, maxDrag.value);
      dragOffset.value = newOffset;
    }
  }

  void handleDragEnd(VoidCallback onComplete) {
    if (dragOffset.value >= maxDrag.value * 0.8) {
      _completeSwipe(onComplete);
    } else {
      _resetSwipe();
    }
  }

  void _completeSwipe(VoidCallback onComplete) {
    isSwiped.value = true;
    final animation = Tween<double>(
      begin: dragOffset.value,
      end: maxDrag.value,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    animation.addListener(() => dragOffset.value = animation.value);
    _animationController.forward().then((_) => onComplete());
  }

  void _resetSwipe() {
    final animation = Tween<double>(begin: dragOffset.value, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    animation.addListener(() => dragOffset.value = animation.value);
    _animationController.forward();
  }
}
