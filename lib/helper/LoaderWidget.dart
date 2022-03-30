// ignore_for_file: file_names
// import 'package:paper_drs/Contants/const_tant.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class LoaderWidget {
//   static BuildContext _context;
//   static bool _dialog = false;

//   static Widget loader() {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 32,
//               height: 32,
//               //padding: EdgeInsets.all(6),
//               // child: CircularProgressIndicator.adaptive(),
//               child: CircularProgressIndicator(
//                 strokeWidth: 4,
//                 color: MyColors.secondaryAppColor,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   static Widget indicatorLoader(double progress) {
//     return Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 32,
//               height: 32,
//               //padding: EdgeInsets.all(6),
//               // child: CircularProgressIndicator.adaptive(value: progress,),
//               child: CircularProgressIndicator(
//                 strokeWidth: 4,
//                 color: MyColors.secondaryAppColor,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   static void showLoaderDialog(BuildContext context) {
//     _dialog = true;
//     _context = context;
//     showDialog(
//         context: _context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return loader();
//         });
//   }

//   static void dismissLoaderDialog() {
//     if (_context != null && _dialog) {
//       Navigator.pop(_context);
//       _dialog = false;
//       _context = null;
//     }
//   }
// }
