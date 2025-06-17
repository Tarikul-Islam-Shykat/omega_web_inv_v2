import 'package:get/get.dart';
import 'package:omega_web_inv/feature/auth/screens/sign_up_screen.dart';
import '../feature/Auth/screens/forget_pasword_screen.dart';
import '../feature/Auth/screens/login_screen.dart';
import '../feature/Auth/screens/otp_very_screen.dart';
import '../feature/splash_screen/screen/splash_screen.dart';
import '../feature/user/subscription/view/user_subscription_plan.dart';

class AppRoute {
  static String splashScreen = '/splashScreen';
  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";
  static String otpVerifyScreen = "/otpVerifyScreen";
  static String forgetScreen = "/forgetScreen";
  static String resetPassScreen = "/resetPassScreen";
  static String businessProfile = "/businessProfile";
  static String consumerProfile = "/consumerProfile";


  static String subscriptionScreen = "/subscriptionScreen";

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignUpScreen() => signUpScreen;
  static String getOTPVerifyScreen() => otpVerifyScreen;
  static String getForgetScreen() => forgetScreen;
  static String getResetPassScreen() => resetPassScreen;

  static String getSubscriptionScreen() => subscriptionScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: otpVerifyScreen, page: () => OTPVerificationScreen()),
    GetPage(name: forgetScreen, page: () => ForgetPasswordScreen()),


    GetPage(name: subscriptionScreen, page: () => SubscriptionPlan()),
  ];
}
