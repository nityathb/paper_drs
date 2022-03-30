import 'package:flutter/material.dart';
import 'package:paper_drs/Contants/const_tant.dart';

class PrefixImage extends StatelessWidget {
  final String? path;
  const PrefixImage({Key? key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 10,
      width: 10,
      child: Image.asset(
        path!,
        fit: BoxFit.contain,
        color: MyColors.secondaryAppColor,
      ),
    );
  }
}
