// ignore_for_file: file_names, must_be_immutable, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/myGetBeatDetailModel.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../Contants/app_contant.dart';

class MyRouteDetailListScreen extends StatefulWidget {
  String routeName;
  String mainName;

  MyRouteDetailListScreen(
      {Key? key, required this.mainName, required this.routeName})
      : super(key: key);

  @override
  State<MyRouteDetailListScreen> createState() =>
      _MyRouteDetailListScreenState();
}

class _MyRouteDetailListScreenState extends State<MyRouteDetailListScreen> {
  Future myGetBeatsDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');

    var uri = Uri.parse(BeatDetails_API + "/GetRetailerDetailsBeatWise");
    var payload = json.encode({
      "SalesmanId": userId.toString(),
      "CompanyId": "null",
      "BeatDay": widget.routeName,
      "SalesmanLoginId": userName.toString()
    });
    print(uri);
    print(json.encode({
      "SalesmanId": userId.toString(),
      "CompanyId": "null",
      "BeatDay": widget.routeName,
      "SalesmanLoginId": userName.toString()
    }));
    var response = await Dio()
        .post(BeatDetails_API + "/GetRetailerDetailsBeatWise", data: payload);
    print(response.data);
    return response.data;
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> refreshList() async {
    refreshKey.currentState!.show();
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgound(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 4.3060.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
                Text(
                  widget.mainName.split('(')[0],
                  style: const TextStyle(
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
              height: 2.h,
            ),
            Expanded(
              child: RefreshIndicator(
                key: refreshKey,
                onRefresh: refreshList,
                child: FutureBuilder(
                  future: myGetBeatsDetails(),
                  builder: (context, AsyncSnapshot s) {
                    if (s.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (s.hasData &&
                        s.connectionState == ConnectionState.done) {
                      List<MyGetBeatDetailModel> items =
                          List<MyGetBeatDetailModel>.from(s.data
                              .map((x) => MyGetBeatDetailModel.fromJson(x)));

                      print(items.length);
                      return items.isEmpty
                          ? const Center(
                              child: Text(
                              "No data found",
                              style: TextStyle(color: Colors.black),
                            ))
                          : Column(
                              children: [
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
                                //       Text(
                                //         "${widget.routeName} Route",
                                //         style: const TextStyle(
                                //             color: Colors.black,
                                //             fontSize: 17,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       const Spacer(),
                                //       Text(
                                //         "${items.length}  ",
                                //         style: const TextStyle(
                                //             color: Colors.black,
                                //             fontSize: 17,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 1.3060.h,
                                // ),
            //                      SizedBox(
            //   height: 1.2.h,
            // ),
            Text(
             "${items.length}",
              style: const TextStyle(
                  color: MyColors.greyTitleColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
            Text(
              "${widget.routeName} Route",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 13),
            ),
            SizedBox(
              height: 0.7.h,
            ),
                                Expanded(
                                  child: ListView.builder(padding: EdgeInsets.zero,
                                    itemCount: items.length,
                                 
                                 
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          InkWell(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15),
                                              child: Material(
                                                elevation: 5,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                                child: Container(
                                                  height: 6.7421.h,
                                                  width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        width: 50.w,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              items[index]
                                                                  .retailerCode!,
                                                              style: const TextStyle(
                                                                  color: MyColors
                                                                      .greyTitleColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14),
                                                            ),
                                                            SizedBox(height: 5,),
                                                            Text(
                                                              items[index]
                                                                  .retailerName!,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  color: MyColors
                                                                      .blueTitleColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 14),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        items[index]
                                                                .amountReceived! +
                                                            "  ",
                                                        style: const TextStyle(
                                                            color: MyColors
                                                                .blueTitleColor,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          index == items.length - 1
                                              ? const SizedBox(
                                                  height: 50,
                                                )
                                              : const SizedBox()
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
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
            ),
          ],
        ),
      )),
    );
  }
}
