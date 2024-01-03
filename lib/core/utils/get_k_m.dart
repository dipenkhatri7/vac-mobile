String formatNumber(int num) {
  if (num < 1000) {
    return num.toString();
  } else if (num < 1000000) {
    return (num / 1000).toStringAsFixed(1) + 'K';
  } else if (num < 1000000000) {
    return (num / 1000000).toStringAsFixed(1) + 'M';
  } else {
    return (num / 1000000000).toStringAsFixed(1) + 'B';
  }
}
// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fun_chat/core/constants/colors.dart';
// import 'package:fun_chat/core/extensions/context_extensions.dart';
// import 'package:fun_chat/core/widgets/Gaps.dart';
// import 'package:fun_chat/src/chat/data/models/messages.dart';
// import 'package:fun_chat/src/chat/presentation/stream/chat.dart';
// import 'package:fun_chat/src/chat/presentation/widgets/messsage.dart';
// import 'package:socket_io_client/socket_io_client.dart';
// import 'package:web_socket_channel/io.dart';

// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key, required this.currentUser});
//   final String currentUser;
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   bool isTyping = false;
//   List<Message> msgs = [];

//   late TextEditingController textController;
  

//   @override
//   void dispose() {
//     socket.dispose();
//     controller.dispose();
//     textController.dispose();
//     socketStream.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white.withOpacity(0.1),
//         titleSpacing: 0,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//           ),
//           onPressed: () {},
//         ),
//         elevation: 3,
//         title: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Row(
//             children: [
//               Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 23,
//                     child: Image.asset(
//                       'assets/profile/profile.png',
//                       width: 60,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const Positioned(
//                     child: CircleAvatar(
//                       radius: 4,
//                     ),
//                   ),
//                 ],
//               ),
//               const HorizontalGap(width: 15),
//               const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Bikraj Shrestha',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   ),
//                   Text(
//                     'Active now',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.call_outlined,
//               size: 30,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.video_call_outlined,
//               size: 30,
//             ),
//           )
//         ],
//       ),
//       body: SafeArea(
//           child: Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 20,
//           vertical: 10,
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: msgs.length,
//                 itemBuilder: (context, index) {
//                   return IndiMsg(
//                     message: msgs[index].message,
//                     date: msgs[index].date,
//                     sent: msgs[index].userId == widget.currentUser,
//                   );
//                 },
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
//               decoration: BoxDecoration(
//                   color: Colors.grey.withOpacity(
//                     0.05,
//                   ),
//                   borderRadius: BorderRadius.circular(10)),
//               child: Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(Icons.attach_file_outlined),
//                   ),
//                   Expanded(
//                     child: TextField(
//                       style: TextStyle(fontSize: 12),
//                       decoration: InputDecoration(
//                           filled: true,
//                           fillColor: KColors.primaryGrey,
//                           border: OutlineInputBorder()),
//                       controller: textController,
//                       onSubmitted: (val) {
//                         sendMessage(val);
//                         textController.clear();
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: context.width / 4.3,
//                     child: isTyping
//                         ? CircleAvatar(
//                             backgroundColor: KColors.primaryColor,
//                             child: IconButton(
//                               onPressed: () {
//                                 sendMessage(textController.text.trim());
//                                 textController.clear();
//                               },
//                               icon: const Icon(
//                                 Icons.send,
//                                 color: Colors.white,
//                               ),
//                             ))
//                         : Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.camera_alt_outlined),
//                               ),
//                               IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(Icons.mic),
//                               )
//                             ],
//                           ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
