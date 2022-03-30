// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:sizer/sizer.dart';

class CustomBackgound extends StatelessWidget {
  Widget child;
  CustomBackgound({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100.h,
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(topBG),
            const  Spacer(),
              Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(leftBG),
               const   Spacer(),
                  Image.asset(rightBG),
                ],
              )
            ],
          ),
        ),
         SizedBox(
          height: 100.h,
          width: double.infinity,
          child: child,
        ),
      ],
    );
  }
}
