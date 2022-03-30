// ignore_for_file: file_names
// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class ShowImageScreen extends StatelessWidget {

//   String? imageURL;

//   ShowImageScreen({Key? key, this.imageURL,})
//       : super(key: key);
//   PageController controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: Colors.black,
//       appBar: AppBar(backgroundColor: Colors.black,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(
//               Icons.close,
//               color: Colors.white,
//             )),
//         title: Text("Image"),
//         centerTitle: true,
//       ),
//       body: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Image.network(
//             "http://gold.sanjivsirdeoghar.com/public"+ imageURL!,
//               fit: BoxFit.fill,
//             ),
//           )
//     );
//   }
// }
