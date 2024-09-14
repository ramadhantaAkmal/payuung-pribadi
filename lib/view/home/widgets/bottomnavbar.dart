// import 'package:flutter/material.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onVerticalDragUpdate: (details) {
//           setState(() {
//             _bottomPosition -= details.delta.dy;
//           });
//         },
//         child: Container(
//           height: 60,
//           color: Colors.blue,
//           child: Center(child: Text('Drag me up or down!')),
//         ),
//       );
//   }
// }