import 'package:get/get.dart';
import '../../Auth/screens/login_screen.dart';

class SplashScreenController extends GetxController {
  void goToNextScreen() {
    Get.offAll(() => LoginScreen());
  }
}
