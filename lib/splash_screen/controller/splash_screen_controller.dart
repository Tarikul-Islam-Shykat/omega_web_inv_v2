import 'package:get/get.dart';
import 'package:omega_web_inv/User/Auth/screens/login_screen.dart';

class SplashScreenController extends GetxController {
  void goToNextScreen() {
    Get.offAll(() => LoginScreen());
  }
}
