import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:paper_drs/AppScreen/Splash_Screen.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Paper DRS',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: customThemeColor,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
