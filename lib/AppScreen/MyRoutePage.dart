// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paper_drs/AppScreen/MyRouteDetailListScreen.dart';
import 'package:paper_drs/AppScreen/ProfilePage.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/myGetRouteModel.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class MyRouteScreen extends StatefulWidget {
  const MyRouteScreen({Key? key}) : super(key: key);

  @override
  State<MyRouteScreen> createState() => _MyRouteScreenState();
}

class _MyRouteScreenState extends State<MyRouteScreen> {
  Future myGetBeats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');

    var uri = Uri.parse(MyBeats_API + "/GetBeats");
    var payload = json.encode({
      "SalesmanId": userId.toString(),
      "CompanyId": "null",
      "SalesmanLoginId": userName.toString()
    });
    var response = await Dio().post(MyBeats_API + "/GetBeats", data: payload);
    print(response.data);
    return response.data;
  }

  List<String> weekend = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<String> weekendDay = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> refreshList() async {
    refreshKey.currentState!.show();
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    return;
  }

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

  String username = "";
  String userID = "";
  fetchUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var userId = prefs.getString('UserId');
    username = prefs.getString('name')!;
    userID = prefs.getString('UserName')!;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgound(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 4.3060.h,
            ),
            Row(
              children: [
                const Text(
                  "My Route",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Spacer(),
                SizedBox(
                  height: 2.94426.h,
                  width: 27.940505.w,
                  child: Image.asset(appLogo),
                )
              ],
            ),
            SizedBox(
              height: 1.2.h,
            ),
            Text(
             userID,
              style: const TextStyle(
                  color: MyColors.greyTitleColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
            Text(
              username,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 13),
            ),
            SizedBox(
              height: 1.3060.h,
            ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Container(
            //   height: 5.2576.h,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: const BorderRadius.all(
            //         Radius.circular(10),
            //       ),
            //       border: Border.all()),
            //   child: Row(
            //     children: [
            //       const SizedBox(
            //         width: 15,
            //       ),
            //       Image.asset(route),
            //       const SizedBox(
            //         width: 15,
            //       ),
            //        Text(
            //        salesmanName,
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 17,
            //             fontWeight: FontWeight.bold),
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 1.3060.h,
            // ),
            RefreshIndicator(
              key: refreshKey,
              onRefresh: refreshList,
              child: FutureBuilder(
                future: myGetBeats(),
                builder: (context, AsyncSnapshot s) {
                  if (s.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (s.hasData &&
                      s.connectionState == ConnectionState.done) {
                    List<MyGetRouteModel> items = List<MyGetRouteModel>.from(
                        s.data.map((x) => MyGetRouteModel.fromJson(x)));

                    print(items.length);
                    return items.isEmpty
                        ? const Center(
                            child: Text(
                            "No data found",
                            style: TextStyle(color: Colors.black),
                          ))
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: weekendDay.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyRouteDetailListScreen(
                                                mainName: index == 0
                                                    ? items[0].monday!
                                                    : index == 1
                                                        ? items[0].tuesday!
                                                        : index == 2
                                                            ? items[0]
                                                                .wednesday!
                                                            : index == 3
                                                                ? items[0]
                                                                    .thursday!
                                                                : index == 4
                                                                    ? items[0]
                                                                        .friday!
                                                                    : index == 5
                                                                        ? items[0]
                                                                            .saturday!
                                                                        : items[0]
                                                                            .sunday!,
                                                routeName: weekend[index]),
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Material(
                                    elevation: 5,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Container(
                                      height: 6.2576.h,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 6.2576.h,
                                            width: 13.96760.w,
                                            decoration: const BoxDecoration(
                                              color: Color(0xffF4BB45),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Text(
                                              weekendDay[index],
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          // SizedBox(
                                          //   width: 16.5.h,
                                          //   child: Text(
                                          //     "${weekend[index]} Route",
                                          //     style: const TextStyle(
                                          //         color: Colors.black54,
                                          //         fontSize: 13,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // ),
                                          SizedBox(
                                            width: 28.h,
                                            child: Text(
                                              index == 0
                                                  ? items[0].monday!
                                                  : index == 1
                                                      ? items[0].tuesday!
                                                      : index == 2
                                                          ? items[0].wednesday!
                                                          : index == 3
                                                              ? items[0]
                                                                  .thursday!
                                                              : index == 4
                                                                  ? items[0]
                                                                      .friday!
                                                                  : index == 5
                                                                      ? items[0]
                                                                          .saturday!
                                                                      : items[0]
                                                                          .sunday!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                  }

                  return const Center(
                      child: Text(
                    "OOPS! NO DATA!",
                    style: TextStyle(color: Colors.black),
                  ));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
