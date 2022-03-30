// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/AppScreen/DetailListScreen.dart';
import 'package:paper_drs/AppScreen/ProfilePage.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/myGetMeterModel.dart';
import 'package:paper_drs/Model/myGetTodaysCashChequeCollection.dart';
import 'package:paper_drs/Model/myGetTodaysCollectionInvoiceListModel.dart';
import 'package:paper_drs/Model/myGetTodaysReceiveable.dart';
import 'package:paper_drs/Model/myProfileDetail.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class HomePageScreen extends StatefulWidget {
  final Function(DateTime) callback;
   HomePageScreen({Key? key,required this.callback}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  Future myGetTodaysCollectionInvoiceList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');

    var uri = Uri.parse(
        TodaysCollectionInvoiceList_API + "/GetTodaysCollectionInvoiceList");
    var payload = json.encode({
      "SalesmanId": userId.toString(),
      "CollectionDate":
          DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
      "CompanyId": "null",
      "SalesmanLoginId": userName.toString()
    });
    print("-------------------------------------");
    print(json.encode({
      "SalesmanId": userId.toString(),
      "CollectionDate":
          DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
      "CompanyId": "null",
      "SalesmanLoginId": userName.toString()
    }));
    print("-------------------------------------");

    var response = await Dio().post(
        TodaysCollectionInvoiceList_API + "/GetTodaysCollectionInvoiceList",
        data: payload);
    print(response.data);
    return response.data;
  }

  Future<bool> myGetTodaysCashChequeCollection() async {
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
            DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
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

  Future<bool> myGetMeterCollection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');
    try {
      var uri = Uri.parse(
          ReceivableAndOutstandingAmountWithMeterPercentage_API + "/GetData");
      var payload = json.encode({
        "SalesmanId": userId.toString(),
        "CollectionDate":
            DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
        "CompanyId": "null",
        "SalesmanLoginId": userName.toString()
      });
      print("payload");
      print(payload);
      print("payload");

      print(payload);
      print("payload");
      print("payload");

      print(payload);
      print("payload");
      print(payload);
      print("payload");

      print(payload);
      print("payload");
      print("payload");

      print(payload);
      print("payload");
      print(payload);
      print("payload");

      print(payload);
      print("payload");
      print("payload");

      print(payload);
      print("payload");
      print(payload);
      print("payload");

      print(payload);
      print("payload");
      print("payload");

      print(payload);
      print("payload");
      print(payload);
      print("payload");

      print(payload);
      print("payload");
      print("payload");

      print(payload);
      var response = await Dio().post(
          ReceivableAndOutstandingAmountWithMeterPercentage_API + "/GetData",
          data: payload);            print(response.data);
      print("response.data");
      print(response.data);
      print("response.data");
      print(response.data);
      print("response.data");
      print("response.data");
      print("response.data");
      print(response.data);
      print("response.data");
      print(response.data);     print("response.data");
      print(response.data);
      print("response.data");
      print(response.data);
      print("response.data");
      print("response.data");
      print("response.data");
      print(response.data);
      print("response.data");
      print(response.data);


      print(response.data);

      if (response.statusCode == 200) {
        myGetMeterModel = List<MyGetMeterModel>.from(
            response.data.map((x) => MyGetMeterModel.fromJson(x)));
     print("response.data");
      print(response.data);
      print("response.data");
      print(response.data);
      print("response.data");
      print("response.data");
      print("response.data");
      print(response.data);
      print("response.data");
      print(response.data);


      print("--------------------------------");
      // print(myGetMeterModel[0].percentageMeterValue);
              setState(() {});
      } else {
        myGetMeterModel = [];
      }
    } catch (err) {
      print(err);
    }

    return true;
  }

  Future<bool> myGetTodaysReceiveable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');
    try {
      var uri = Uri.parse(TodaysReceiveable_API + "/GetTodaysReceiveable");
      var payload = json.encode({
        "SalesmanId": userId.toString(),
        "CollectionDate":
            DateFormat("yyyy-MM-dd").format(selectedDate).toString(),
        "CompanyId": "null",
        "SalesmanLoginId": userName.toString()
      });
      var response = await Dio()
          .post(TodaysReceiveable_API + "/GetTodaysReceiveable", data: payload);
      print(response.data);

      if (response.statusCode == 200) {
        myMyGetTodaysReceiveableModel = List<MyGetTodaysReceiveableModel>.from(
            response.data.map((x) => MyGetTodaysReceiveableModel.fromJson(x)));
      } else {
        myMyGetTodaysReceiveableModel = [];
      }
    } catch (err) {
      print(err);
    }
    return true;
  }

  List<MyGetTodaysCashChequeCollectionModel>
      myGetTodaysCashChequeCollectionModel = [];
  List<MyGetMeterModel> myGetMeterModel = [];
  List<MyGetTodaysReceiveableModel> myMyGetTodaysReceiveableModel = [];

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> refreshList() async {
    refreshKey.currentState!.show();
    setState(() {});
    fetchAllThreeData();
    await Future.delayed(const Duration(seconds: 2));
    return;
  }

  @override
  void initState() {
    super.initState();
    myGetProfileData();

    fetchAllThreeData();
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

  fetchAllThreeData() async {
    // await Future.delayed(const Duration(seconds: 1));
    // callingLoader();
    await myGetTodaysCashChequeCollection();
    await myGetMeterCollection();
    await myGetTodaysReceiveable();
    setState(() {});
    // Navigator.pop(context);
  }

  Future myGetProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');

    var payload = json.encode({
      "SalesmanId": userId.toString(),
      "SalesmanLoginId": userName.toString()
    });
    var response =
        await Dio().post(GetSalesmanProfile_API + "/GetData", data: payload);
    print(response.data);
    if (response.statusCode == 200) {
      List<MyGetProfileModel> items = List<MyGetProfileModel>.from(
          response.data.map((x) => MyGetProfileModel.fromJson(x)));
      setState(() {
        salesmanName = items.isEmpty ? "" : items[0].salesmanName!;
      });
    }
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
                Text(
                  salesmanName,
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
            topheaderDesign(),
            SizedBox(
              height: 1.3060.h,
            ),
            Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.transparent,
              child: LinearProgressIndicator(
                minHeight: 7,
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
                value: myGetMeterModel.isEmpty
                    ? 0
                    : (myGetMeterModel[0].percentageMeterValue! / 100.0),
              ),
            ),
            SizedBox(
              height: 1.3060.h,
               ),
            Container(
              height: 6.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                border: Border.all(color: MyColors.greyTitleColor),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(8),
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Text(
                      "₹",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Today's Receivable",
                        style: TextStyle(
                            color: MyColors.blueTitleColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                      Text(
                        "Nestle - All",
                        style: TextStyle(
                            color: MyColors.greyTitleColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  myMyGetTodaysReceiveableModel.isNotEmpty
                      ? Text(
                          "₹ ${numberFormat.format((myMyGetTodaysReceiveableModel[0].todaysReceivable!.round()))}/-",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          "₹ 0/-",
                          style: TextStyle(
                              color: MyColors.blueTitleColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                  Container(
                    width: 10,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: MyColors.greyTitleColor),
                  )
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                key: refreshKey,
                onRefresh: refreshList,
                child: FutureBuilder(
                  future: myGetTodaysCollectionInvoiceList(),
                  builder: (context, AsyncSnapshot s) {
                    if (s.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (s.hasData &&
                        s.connectionState == ConnectionState.done) {
                      List<MyGetTodaysCollectionInvoiceListModel> items =
                          List<MyGetTodaysCollectionInvoiceListModel>.from(s
                              .data
                              .map((x) => MyGetTodaysCollectionInvoiceListModel
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

  Widget listBuildDesign(List<MyGetTodaysCollectionInvoiceListModel> items) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailListScreen(
                          itemData: items[index],
                        ),
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
                      height: 6.7421.h,
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
                            width: 60.w,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  items[index].retailerCode!,
                                  style: const TextStyle(
                                      color: MyColors.greyTitleColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  items[index].retailerName!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: MyColors.blueTitleColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "₹ " +
                                numberFormat
                                    .format(items[index].netAmount!.round()) +
                                "/- ",
                            style: const TextStyle(
                                color: MyColors.blueTitleColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          Container(
                              width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: hexToColor(items[index].colorCode!))),
                        ],
                      ),
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
        });
  }

  Widget topheaderDesign() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => _selectDate(context),
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
                              "Date",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              DateFormat("dd/MM/yyyy").format(selectedDate),
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
                        child: Image.asset(giveCash),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Today’s Collection",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          myGetTodaysCashChequeCollectionModel.isNotEmpty
                              ? Text(
                                  "₹ ${numberFormat.format((myGetTodaysCashChequeCollectionModel[0].chequeCollection!.round() + myGetTodaysCashChequeCollectionModel[0].cashCollection!.round()))}/-",
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
        ),
        SizedBox(
          height: 1.3060.h,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  widget.callback(DateTime.now());
                },
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
                            const SizedBox(
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
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  widget.callback(DateTime.now());
                },

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
                              "Cheque Collection",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            myGetTodaysCashChequeCollectionModel.isNotEmpty
                                ? Text(
                                    "₹ ${numberFormat.format(myGetTodaysCashChequeCollectionModel[0].chequeCollection!.round())}/-",
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
            ),
          ],
        ),
      ],
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        fetchAllThreeData();
      });
    }
  }
}
