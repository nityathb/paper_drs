import 'package:flutter/material.dart';

const Color inputcolor = Colors.black12;
const Color textcolor = Colors.black54;
const Color iconcolor = Colors.black54;
// const Color primaryColor = Color(0xFF00D2F5); //00D2F5

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class MyColors {
  static const Color primaryAppColor = Color(0xFFF4BB45);
  static const Color secondaryAppColor = Color(0xFF861F41);
  // static const Color tertiaryAppColor = Color(0xFF4DA9D0);
  // static const Color quarternaryAppColor = Color(0xFF5FB3B3);

  static const Color white = Color(0xFFFFFFFF);

  static const Color primaryAppBGColor = Color(0xFFF8F9FB);
  static const Color secondaryAppBGColor = Color(0xFFEEF2F8);
  static const Color tertiaryAppBGColor =
      Color(0xFFF1F5FA); //textField bg color
  // static const Color quarternaryAppBGColor = Color(0xFF);

  static const Color primaryContainerBGColor = Color(0xFFE6F5F4);
  static const Color secondaryContainerBGColor = Color(0xFFE4F2F8);
  // static const Color tertiaryContainerBGColor = Color(0xFF3C89BB);
  // static const Color quarternaryContainerBGColor = Color(0xFFF7F8F4);

  static const Color blueTitleColor = Color(0xFF001C64);
  static const Color redTitleColor = Color(0xFFDF3731);
  static const Color greenTitleColor = Color(0xFF339966);
  static const Color greyTitleColor = Color(0xFF808080);
  static const Color brownTitleColor = Color(0xFF885C00);
  static const Color yellowTitleColor = Color(0xFFF4BB45);
  static const Color purpleTitleColor = Color(0xFFB31FD8);
  // static const Color primaryHeadingColor = Color(0xFF463853);
  static Color primarySubHeadingColor =
      const Color(0xFF463853).withOpacity(0.5);
  // static const Color primaryTextColor = Color(0xFF4DA9D0);
  // static const Color secondaryTextColor = Color(0xFF8A9DB6);
}

Map<int, Color> color = {
  50: const Color.fromRGBO(244, 187, 69, .1),
  100:const Color.fromRGBO(244, 187, 69, .2),
  200:const Color.fromRGBO(244, 187, 69, .3),
  300:const Color.fromRGBO(244, 187, 69, .4),
  400:const Color.fromRGBO(244, 187, 69, .5),
  500:const Color.fromRGBO(244, 187, 69, .6),
  600:const Color.fromRGBO(244, 187, 69, .7),
  700:const Color.fromRGBO(244, 187, 69, .8),
  800:const Color.fromRGBO(244, 187, 69, .9),
  900:const Color.fromRGBO(244, 187, 69, 1),
};

MaterialColor customThemeColor = MaterialColor(0xFFF4BB45, color);
