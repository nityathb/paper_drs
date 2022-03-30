// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/myGetTodaysCashChequeCollection.dart';
import 'package:paper_drs/Model/myGetTodaysCashChequeCollectionReport.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CollectionReportScreen extends StatefulWidget {
  const CollectionReportScreen({Key? key}) : super(key: key);

  @override
  State<CollectionReportScreen> createState() => _CollectionReportScreenState();
}

class _CollectionReportScreenState extends State<CollectionReportScreen> {
  Future<dynamic> myGetTodaysCashChequeCollection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    try {
      var uri = Uri.parse(TodaysCashChequeCollectionReport_API +
          "/GetTodaysCashChequeCollectionReport");
      var payload = json.encode({
        "StartDate":
            DateFormat("yyyy-MM-dd").format(selectedStartDate).toString(),
        "salesmanId": userId.toString(),
        "companyId": "null",
        "SalesmanLoginId": userName.toString(),
        "EndDate": DateFormat("yyyy-MM-dd").format(selectedEndDate).toString()
      });
      var response = await Dio().post(
          TodaysCashChequeCollectionReport_API +
              "/GetTodaysCashChequeCollectionReport",
          data: payload);
      print(response.data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<bool> myGetTodaysCashChequeCollectionValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var companyId = prefs.getString('CompanyId');
    try {
      var uri = Uri.parse(
          TodaysCashChequeCollection_API + "/GetTodaysCashChequeCollection");
      var payload = json.encode({
        "SalesmanId": userId.toString(),
        "CollectionDate":
            DateFormat("yyyy-MM-dd").format(selectedStartDate).toString(),
        "CompanyId": "null",
        "SalesmanLoginId": userName.toString()
      });
      var response = await Dio().post(
          TodaysCashChequeCollection_API + "/GetTodaysCashChequeCollection",
          data: payload);
      print(response.data);

      if (response.statusCode == 200) {
        myGetTodaysCashChequeCollectionModel =
            List<MyGetTodaysCashChequeCollectionModel>.from(response.data
                .map((x) => MyGetTodaysCashChequeCollectionModel.fromJson(x)));
      } else {
        myGetTodaysCashChequeCollectionModel = [];
      }
    } catch (err) {
      print(err);
    }

    return true;
  }

  List<MyGetTodaysCashChequeCollectionModel>
      myGetTodaysCashChequeCollectionModel = [];

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

    fetchAllData();
  }

  callingLoader() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
                content: Row(
              children: const [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Loading..."),
                ),
              ],
            )));
  }

  fetchAllData() async {
    await Future.delayed(const Duration(seconds: 1));
    // callingLoader();
    await myGetTodaysCashChequeCollectionValue();

    setState(() {});
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgound(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 4.3060.h,
            ),
            Row(
              children: [
                const Text(
                  "Collection Report",
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
              height: 2.h,
            ),
            topheaderEndStartDateDesign(),
            SizedBox(
              height: 1.3060.h,
            ),
            colectionRowDesign(),
            SizedBox(
              height: 1.3060.h,
            ),
            checkBoxRow(),
            Expanded(
              child: RefreshIndicator(
                key: refreshKey,
                onRefresh: refreshList,
                child: FutureBuilder(
                  future: myGetTodaysCashChequeCollection(),
                  builder: (context, AsyncSnapshot s) {
                    if (s.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (s.hasData &&
                        s.connectionState == ConnectionState.done) {
                      List<MyGetTodaysCashChequeCollectionReportModel> items =
                          List<MyGetTodaysCashChequeCollectionReportModel>.from(
                              s.data.map((x) =>
                                  MyGetTodaysCashChequeCollectionReportModel
                                      .fromJson(x)));

                      print(items.length);
                      return items.isEmpty
                          ? const Center(
                              child: Text(
                              "No data found",
                              style: TextStyle(color: Colors.black),
                            ))
                          : listBuildDesign(items);
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

  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  bool cash = true, verift = true, unverify = true;
  Widget checkBoxRow() {
    return Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      height: 20,
                      width: 20,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: MyColors.brownTitleColor,
                        ),
                        child: Checkbox(
                          checkColor: Colors.white,
                          activeColor: MyColors.brownTitleColor,
                          value: cash,
                          onChanged: (value) {
                            setState(() {
                              cash = value!;
                            });
                          },
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Cash",
                    style: TextStyle(
                        color: MyColors.brownTitleColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 13),
                  ),
                ],
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: MyColors.greenTitleColor,
                      ),
                      child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: MyColors.greenTitleColor,
                        value: verift,
                        onChanged: (value) {
                          setState(() {
                            verift = value!;
                          });
                        },
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Verify",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                    height: 20,
                    width: 20,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: MyColors.redTitleColor,
                      ),
                      child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: MyColors.redTitleColor,
                        value: unverify,
                        onChanged: (value) {
                          setState(() {
                            unverify = value!;
                          });
                        },
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Un-Verify",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
              ]),
            ],
          ),
        ));
  }

  Widget listBuildDesign(
      List<MyGetTodaysCashChequeCollectionReportModel> items) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (cash == false) {
            if (verift == true &&
                items[index].paymentType == "Verified Payment") {
              print("verify");
              return cardDetail(items, index);
            } else if (unverify == true &&
                items[index].paymentType == "Pending Payment") {
              print("pending");
              return cardDetail(items, index);
            } else {
              print("all");
              return Column(children: [
                const SizedBox(),
                index == items.length - 1
                    ? const SizedBox(
                        height: 50,
                      )
                    : const SizedBox()
              ]);
            }
          } else {
            if (cash == true && items[index].cheque! <= 0.0) {
              if (verift == true &&
                  items[index].paymentType == "Verified Payment") {
                print("verify");
                return cardDetail(items, index);
              } else if (unverify == true &&
                  items[index].paymentType == "Pending Payment") {
                print("pending");
                return cardDetail(items, index);
              } else {
                print("all");
                return Column(children: [
                  const SizedBox(),
                  index == items.length - 1
                      ? const SizedBox(
                          height: 50,
                        )
                      : const SizedBox()
                ]);
              }
            } else {
              return Column(children: [
                const SizedBox(),
                index == items.length - 1
                    ? const SizedBox(
                        height: 50,
                      )
                    : const SizedBox()
              ]);
            }
          }
        });
  }

  Widget cardDetail(
      List<MyGetTodaysCashChequeCollectionReportModel> items, int index) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Material(
            elevation: 5,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: Container(
              height: 6.7421.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 35.w,
                              child: Text(
                                items[index].retailerCode!,
                                style: const TextStyle(
                                    color: MyColors.greyTitleColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              width: 26.w,
                              child: Text(
                                items[index].cheque! <= 0.0 ? "CASH" : "CHEQUE",
                                style: TextStyle(
                                    color: hexToColor(items[index].colorCode!),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: 26.1.w,
                              child: Text(
                                items[index].cheque! <= 0.0
                                    ? "₹ " +
                                        numberFormat.format(
                                            items[index].cash!.round()) +
                                        "/- "
                                    : "₹ " +
                                        numberFormat.format(
                                            items[index].cheque!.round()) +
                                        "/- ",
                                style: const TextStyle(
                                    color: MyColors.greyTitleColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 56.w,
                              child: Text(
                                items[index].retailerName!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: MyColors.blueTitleColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              width: 31.w,
                              child: Text(
                                DateFormat("dd-MM-yyyy H:m").format(
                                    DateTime.parse(
                                        items[index].paymentReceivedDate!)),
                                style: const TextStyle(
                                    color: MyColors.greyTitleColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 10,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: hexToColor(items[index].colorCode!)),
                  )
                ],
              ),
            ),
          ),
        ),
        index == items.length - 1
            ? const SizedBox(
                height: 80,
              )
            : const SizedBox()
      ],
    );
  }

  Widget topheaderEndStartDateDesign() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => _selectStartDate(context),
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
                      child: Image.asset(calender),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Start Date",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          DateFormat("dd/MM/yyyy").format(selectedStartDate),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => _selectEndDate(context),
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
                      child: Image.asset(calender),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "End Date",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          DateFormat("dd/MM/yyyy").format(selectedEndDate),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget colectionRowDesign() {
    return Row(
      children: [
        Expanded(
          flex: 1,
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
                    child: Image.asset(money),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Cash Collection",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      myGetTodaysCashChequeCollectionModel.isNotEmpty
                          ? Text(
                              "₹ ${numberFormat.format(myGetTodaysCashChequeCollectionModel[0].cashCollection!.round())}/-",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              "₹ 0/-",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          flex: 1,
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
                    child: Image.asset(bankCollection),
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Bank Collection",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      myGetTodaysCashChequeCollectionModel.isNotEmpty
                          ? Text(
                              "₹ ${numberFormat.format(myGetTodaysCashChequeCollectionModel[0].bankCollection!.round())}/-",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )
                          : const Text(
                              "₹ 0/-",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  DateTime selectedStartDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
      // callingLoader();
      await myGetTodaysCashChequeCollectionValue();

      setState(() {});
      // Navigator.pop(context);
    }
  }

  DateTime selectedEndDate = DateTime.now();

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate,
        firstDate: selectedStartDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }
}
