import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Auth/screens/login_screen.dart';

import '../../user/bottom_nav_bar/screen/custom_bottom_navbar.dart';

class SplashScreenController extends GetxController {
  void goToNextScreen() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    final String? token = sh.getString("token");

    await Future.delayed(const Duration(seconds: 2));
    if (token != null && token.isNotEmpty) {
      Get.offAll(() => BottomNavBarScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }
}
