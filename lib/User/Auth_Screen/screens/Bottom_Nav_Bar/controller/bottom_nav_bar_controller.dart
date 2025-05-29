// // main.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:omega_web_inv/User/Auth_Screen/controller/Bottom_Nav_Bar/screen/custom_bottom_navbar.dart';
// import 'package:omega_web_inv/User/Auth_Screen/screens/Home/home_screen.dart';

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
import 'package:omega_web_inv/User/Auth_Screen/screens/Home/home_screen.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Workouts/workout_page.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeContent(),
    WorkoutPage(),
    const Center(
      child: Text('Favorites', style: TextStyle(color: Colors.white)),
    ),
    const Center(child: Text('Stats', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Profile', style: TextStyle(color: Colors.white))),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  Widget get currentScreen => screens[selectedIndex.value];
}
