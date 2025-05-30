// // ignore_for_file: use_super_parameters

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:prettyrini/core/const/app_colors.dart';
// import 'package:prettyrini/core/const/sizer.dart';
// import 'package:prettyrini/feature/chatbox/chat_message.dart';
// import 'package:prettyrini/feature/chatbox/chatlist_controller/chat_controller.dart';
// import 'package:prettyrini/feature/chatbox/chatlist_model/chat_model.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ChatController chatController = Get.put(ChatController());

//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: SizeConfig.heightPercent(context, 4)),
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: SizeConfig.widthPercent(context, 4),
//               vertical: SizeConfig.heightPercent(context, 1),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Chatting',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: SizeConfig.heightPercent(context, 3),
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         _showSubscriptionPopup(context); // Show popup on tap
//                       },
//                       child: CircleAvatar(
//                         radius: SizeConfig.heightPercent(context, 2.5),
//                         backgroundColor: const Color(0xFF1F1F21),
//                         child: Image.asset(
//                           'assets/images/search.png',
//                           height: SizeConfig.heightPercent(context, 2.5),
//                           width: SizeConfig.heightPercent(context, 2.5),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   color: Color(0xFFFFFFFF).withValues(alpha: 0.16),
//                   height: SizeConfig.heightPercent(context, 1),
//                   thickness: 0.5,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: chatController.chatList.length,
//                 itemBuilder: (context, index) {
//                   final chat = chatController.chatList[index];
//                   return GestureDetector(
//                     onTap: () {
//                       // Navigate to ChatDetailScreen with the contact name
//                       Get.to(() => ChatDetailScreen(contactName: chat.name));
//                     },
//                     child: _buildChatItem(context, chat),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChatItem(BuildContext context, ChatModel chat) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: SizeConfig.widthPercent(context, 5),
//         vertical: SizeConfig.heightPercent(context, 1.5),
//       ),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: SizeConfig.heightPercent(context, 2),
//             backgroundImage: AssetImage(chat.profileImage),
//           ),
//           SizedBox(width: SizeConfig.widthPercent(context, 2.5)),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   chat.name,
//                   style: TextStyle(
//                     color: Color(0xFFFFFFFF).withValues(alpha: 0.85),
//                     fontSize: SizeConfig.heightPercent(context, 1.5),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: SizeConfig.heightPercent(context, 0.5)),
//                 Text(
//                   chat.messagePreview,
//                   style: TextStyle(
//                     color: Color(0xFF8D8B84),
//                     fontSize: SizeConfig.heightPercent(context, 1.5),
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           // Timestamp
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 chat.dateandtime,
//                 style: TextStyle(
//                   color: Color(0xFF8D8B84),
//                   fontSize: SizeConfig.heightPercent(context, 1.6),
//                 ),
//               ),
//               Text(
//                 chat.timestamp,
//                 style: TextStyle(
//                   color: Color(0xFF8D8B84),
//                   fontSize: SizeConfig.heightPercent(context, 1.6),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _showSubscriptionPopup(BuildContext context) {
//     bool isChecked = false;

//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Dialog(
//               backgroundColor: AppColors.primaryColor,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Container(
//                 padding: EdgeInsets.all(SizeConfig.widthPercent(context, 5)),
//                 // width: SizeConfig.widthPercent(context, 100),
//                 width: 328,
//                 height: 388,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: Text(
//                         textAlign: TextAlign.center,
//                         'Subscription Plans',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: SizeConfig.heightPercent(context, 3),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: SizeConfig.heightPercent(context, 2)),
//                     Text(
//                       textAlign: TextAlign.center,
//                       'Access premium features to showcase your work, connect, and grow faster.',
//                       style: TextStyle(
//                         color: Color(0xFFFFFFFF).withValues(alpha: 0.80),
//                         fontSize: SizeConfig.heightPercent(context, 1.5),
//                       ),
//                     ),
//                     SizedBox(height: SizeConfig.heightPercent(context, 3)),
//                     Container(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: SizeConfig.widthPercent(context, 4),
//                         vertical: SizeConfig.heightPercent(context, 2),
//                       ),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF1F1F21),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 isChecked = !isChecked;
//                               });
//                             },
//                             child: Container(
//                               width: SizeConfig.heightPercent(context, 3),
//                               height: SizeConfig.heightPercent(context, 3),
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                   color: Color(0xFF797979),
//                                   width: 2,
//                                 ),
//                                 color:
//                                     isChecked
//                                         ? Colors.white
//                                         : Colors.transparent,
//                               ),
//                               child:
//                                   isChecked
//                                       ? Icon(
//                                         Icons.check,
//                                         size: SizeConfig.heightPercent(
//                                           context,
//                                           2,
//                                         ),
//                                         color: AppColors.primaryColor,
//                                       )
//                                       : null,
//                             ),
//                           ),
//                           SizedBox(width: SizeConfig.widthPercent(context, 3)),
//                           Text(
//                             '\$9.99 / Per Month',
//                             style: TextStyle(
//                               color: Color(0xFF797979),
//                               fontSize: SizeConfig.heightPercent(context, 2.2),
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: SizeConfig.heightPercent(context, 3)),
//                     ElevatedButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.white,
//                         foregroundColor: AppColors.primaryColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         minimumSize: Size(
//                           SizeConfig.widthPercent(context, 70),
//                           SizeConfig.heightPercent(context, 6),
//                         ),
//                       ),
//                       child: Text(
//                         'Continue',
//                         style: TextStyle(
//                           fontSize: SizeConfig.heightPercent(context, 2),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
