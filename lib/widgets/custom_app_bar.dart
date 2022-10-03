// // import 'package:flutter/material.dart';
// // import 'package:movie_app/assets.dart';
// //
// // class CustomAppBar extends StatefulWidget {
// //   const CustomAppBar({Key? key}) : super(key: key);
// //
// //   @override
// //   State<CustomAppBar> createState() => _CustomAppBarState();
// // }
//
// class _CustomAppBarState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         vertical: 10.0,
//         horizontal: 15.0,
//       ),
//       color: Colors.red,
//       child: SafeArea(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () => print('tapped'),
//               child: Image.asset(Assets.loginLogo),
//               // const SizedBox(width: 26),
//             ),
//             Padding(
//               padding: EdgeInsets.only(right: 10.0),
//               child: GestureDetector(
//                 onTap: () => print('searching'),
//                 child: Image.asset(Assets.search),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // }
