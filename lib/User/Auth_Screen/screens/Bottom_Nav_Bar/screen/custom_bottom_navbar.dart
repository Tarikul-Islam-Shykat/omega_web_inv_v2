// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomBottomNavbar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;

//   const CustomBottomNavbar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70.h,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E1E1E),
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             blurRadius: 10.r,
//             offset: const Offset(0, -2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _navItem(icon: Icons.home_rounded, label: 'Home', index: 0),
//           _navItem(icon: Icons.flag_outlined, label: 'Goals', index: 1),
//           _navItem(icon: Icons.favorite_border, label: 'Favorites', index: 2),
//           _navItem(icon: Icons.bar_chart, label: 'Stats', index: 3),
//           _navItem(icon: Icons.person_outline, label: 'Profile', index: 4),
//         ],
//       ),
//     );
//   }

//   Widget _navItem({
//     required IconData icon,
//     required String label,
//     required int index,
//   }) {
//     final isSelected = index == selectedIndex;

//     return GestureDetector(
//       onTap: () => onItemTapped(index),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? Colors.redAccent : Colors.grey[500],
//             size: isSelected ? 28.sp : 24.sp,
//           ),
//           SizedBox(height: 4.h),
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected ? Colors.redAccent : Colors.grey[500],
//               fontSize: 11.sp,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// bottom_navbar_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Bottom_Nav_Bar/controller/bottom_nav_bar_controller.dart';
import 'package:omega_web_inv/User/Auth_Screen/screens/Bottom_Nav_Bar/screen/custom_bottom_navbar_screen.dart';

class BottomNavBarScreen extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());

  BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            controller.currentScreen,
            Positioned(
              left: -10.w,
              right: -10.w,
              bottom: 10.h,
              child: CustomBottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
