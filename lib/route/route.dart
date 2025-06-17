import 'package:get/get.dart';
import '../feature/auth/screen/forget_pasword_screen.dart';
import '../feature/auth/screen/login_screen.dart';
import '../feature/auth/screen/otp_very_screen.dart';
import '../feature/auth/screen/reset_password.dart';
import '../feature/auth/screen/sign_up_screen.dart';
import '../feature/splash_screen/screen/splash_screen.dart';

class AppRoute {

  //------auth -------
  static String splashScreen = '/splashScreen';
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String otpVerifyScreen = "/otpVerifyScreen";
  static String forgetScreen = "/forgetScreen";
  static String resetPassScreen = "/resetPassScreen";

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignUpScreen() => signUpScreen;
  static String getOTPVerifyScreen() => otpVerifyScreen;
  static String getForgetScreen() => forgetScreen;
  static String getResetPassScreen() => resetPassScreen;

  static List<GetPage> routes = [

    //--------auth--------
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: otpVerifyScreen, page: () => OtpVeryScreen()),
    GetPage(name: forgetScreen, page: () => const ForgetPasswordScreen()),
    GetPage(name: resetPassScreen, page: () => ResetPassword()),
  ];
}
