import 'package:get/get.dart';
import 'package:omega_web_inv/Auth_Screen/screens/login_screen.dart';

class SplashScreenController extends GetxController {
  void goToNextScreen() {
    Get.offAll(() => LoginScreen());
  }
}
