import 'package:paper_drs/Contants/image_constant.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      appLogo,
      height: 60,
    );
  }
}
