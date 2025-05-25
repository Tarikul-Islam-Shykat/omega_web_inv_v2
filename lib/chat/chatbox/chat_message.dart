// // ignore_for_file: use_super_parameters

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:prettyrini/core/const/app_colors.dart';
// import 'package:prettyrini/core/const/sizer.dart';

// class ChatDetailScreen extends StatelessWidget {
//   final String contactName;

//   const ChatDetailScreen({Key? key, required this.contactName})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: Row(
//           children: [
//             const CircleAvatar(
//               radius: 20,
//               backgroundImage: AssetImage('assets/images/profileImage.png'),
//             ),
//             const SizedBox(width: 18),
//             Text(
//               contactName,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: SizeConfig.heightPercent(context, 2.2),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(child: Container(color: AppColors.primaryColor)),
//           _buildMessageInputField(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageInputField(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: SizeConfig.widthPercent(context, 4),
//         vertical: SizeConfig.heightPercent(context, 2),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Color(0xFFA3A3A3).withValues(alpha: 0.10),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: const TextField(
//                 style: TextStyle(color: Colors.white),
//                 decoration: InputDecoration(
//                   hintText: 'Message',
//                   hintStyle: TextStyle(color: Colors.grey),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 15,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: SizeConfig.widthPercent(context, 2)),
//           CircleAvatar(
//             radius: 28.0,
//             backgroundColor: Color(0xFFA3A3A3).withValues(alpha: 0.10),
//             child: Image.asset('assets/images/send.png', height: 30, width: 30),
//           ),
//         ],
//       ),
//     );
//   }
// }
