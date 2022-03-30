// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:paper_drs/AppScreen/CollectionReportPage.dart';
import 'package:paper_drs/AppScreen/HomePage.dart';
import 'package:paper_drs/AppScreen/MyRoutePage.dart';
import 'package:paper_drs/AppScreen/ProfilePage.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:sizer/sizer.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  List<Widget> pageList = [
     
  ];
  int currentIndex = 0;
@override
void initState(){
super.initState();
pageList = [
     HomePageScreen(
       callback: (val){
         setState(() {
           currentIndex = 2;
         });
       },
     ),
    const MyRouteScreen(),
    const CollectionReportScreen(),
    const ProfilePageScreen()
  ];


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(children: pageList, index: currentIndex),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 9.h,
              width: 100.w,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () => setState(() {
                          currentIndex = 0;
                        }),
                        child: SizedBox(
                          width: 23.5.w,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 4.9421.h,
                                width: 11.96760.w,
                                decoration: BoxDecoration(
                                  color: currentIndex == 0
                                      ? const Color(0xffF4BB45)
                                      : Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: currentIndex == 0
                                          ? const Color(0xffF4BB45)
                                          : Colors.black),
                                ),
                                child: Image.asset(home),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                    color: currentIndex == 0
                                        ? Colors.black
                                        : Colors.black54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          currentIndex = 1;
                        }),
                        child: SizedBox(
                          width: 23.5.w,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 4.9421.h,
                                width: 11.96760.w,
                                decoration: BoxDecoration(
                                  color: currentIndex == 1
                                      ? const Color(0xffF4BB45)
                                      : Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: currentIndex == 1
                                          ? const Color(0xffF4BB45)
                                          : Colors.black),
                                ),
                                child: Image.asset(route),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "My Route",
                                style: TextStyle(
                                    color: currentIndex == 1
                                        ? Colors.black
                                        : Colors.black54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          currentIndex = 2;
                        }),
                        child: SizedBox(
                          width: 23.5.w,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 4.9421.h,
                                width: 11.96760.w,
                                decoration: BoxDecoration(
                                  color: currentIndex == 2
                                      ? const Color(0xffF4BB45)
                                      : Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: currentIndex == 2
                                          ? const Color(0xffF4BB45)
                                          : Colors.black),
                                ),
                                child: Image.asset(wallet),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              FittedBox(
                                child: Text(
                                  "Collection Report",maxLines: 1,
                                  style: TextStyle(
                                      color: currentIndex == 2
                                          ? Colors.black
                                          : Colors.black54,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          currentIndex = 3;
                        }),
                        child: SizedBox(
                          width: 23.5.w,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 4.9421.h,
                                width: 11.96760.w,
                                decoration: BoxDecoration(
                                  color: currentIndex == 3
                                      ? const Color(0xffF4BB45)
                                      : Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: currentIndex == 3
                                          ? const Color(0xffF4BB45)
                                          : Colors.black),
                                ),
                                child: Image.asset(profile),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Profile",
                                style: TextStyle(
                                    color: currentIndex == 3
                                        ? Colors.black
                                        : Colors.black54,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
