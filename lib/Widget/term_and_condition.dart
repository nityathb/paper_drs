// import 'package:paper_drs/Contants/const_tant.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// class TermAndCondition extends StatelessWidget {
//   final bool? value;
//   final void Function(bool?)? onChanged;
//   const TermAndCondition({this.onChanged, this.value, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.only(top: 10, bottom: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Checkbox(
//               activeColor: primaryColor,
//               value: value,
//               onChanged: onChanged,
//             ),
//             Expanded(
//               child: RichText(
//                 text: TextSpan(
//                     text: 'I want to Join with',
//                     style: TextStyle(color: textcolor, fontSize: 14),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: " Finhub",
//                           style: TextStyle(
//                               color: primaryColor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                           recognizer: TapGestureRecognizer()..onTap = () {}),
//                       TextSpan(
//                         text: 'as a',
//                         style: TextStyle(color: textcolor, fontSize: 14),
//                       ),
//                       TextSpan(
//                           text: " Service Provider.",
//                           style: TextStyle(
//                               color: primaryColor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                           recognizer: TapGestureRecognizer()..onTap = () {}),
//                     ]),
//               ),
//             )
//           ],
//         ));
//   }
// }
