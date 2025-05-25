import 'package:get/get.dart';

class SwipeController extends GetxController {
  final dragOffset = 0.0.obs;
  final maxDragDistance = 200.0;

  void updateDrag(double delta) {
    dragOffset.value += delta;
    dragOffset.value = dragOffset.value.clamp(0.0, maxDragDistance);
  }

  void handleDragEnd(Function onComplete) {
    if (dragOffset.value > maxDragDistance * 0.8) {
      onComplete();
    }
    dragOffset.value = 0.0;
  }
}
