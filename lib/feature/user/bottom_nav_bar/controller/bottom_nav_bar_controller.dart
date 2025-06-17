// // main.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:omega_web_inv/user/Auth_Screen/controller/bottom_nav_bar/screen/custom_bottom_navbar.dart';
// import 'package:omega_web_inv/user/Auth_Screen/screens/home/home_screen.dart';

// class BottomNavController extends GetxController {
//   var selectedIndex = 0.obs;

//   void onTabTapped(int index) {
//     selectedIndex.value = index;
//   }
// }

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final BottomNavController controller = Get.put(BottomNavController());

// final List<Widget> _screens = [
//   const HomeContent(),
//   const Center(child: Text('Goals', style: TextStyle(color: Colors.white))),
//   const Center(child: Text('Favorites')),
//   const Center(child: Text('Stats')),
//   const Center(child: Text('Profile')),
// ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E1E1E),
//       body: SafeArea(
//         child: Obx(() => _screens[controller.selectedIndex.value]),
//       ),
//       bottomNavigationBar: Obx(
//         () => CustomBottomNavbar(
//           selectedIndex: controller.selectedIndex.value,
//           onItemTapped: controller.onTabTapped,
//         ),
//       ),
//     );
//   }
// }

// bottom_nav_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../admin/manage_workout/workout_page.dart';
import '../../community/view/user_community_screen.dart';
import '../../home/view/home_screen.dart';
import '../../nutrition/nutrition_page.dart';
import '../../progress/screen/progress_screen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeContent(),
    WorkoutPage(),
    NutritionPage(),
    ProgressScreen(),
    CommunityScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget get currentScreen => screens[selectedIndex.value];
}
