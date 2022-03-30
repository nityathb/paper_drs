// ignore_for_file: file_names, unused_local_variable, avoid_print, unnecessary_string_interpolations

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/AppScreen/InvoiceDetailListScreen.dart';
import 'package:paper_drs/AppScreen/InvoiceDetailScreen.dart';
import 'package:paper_drs/AppScreen/MakePaymentScreen.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';

import 'package:paper_drs/Model/AmountForPaymentModel.dart';
import 'package:paper_drs/Model/GetMyCategoryModel.dart';
import 'package:paper_drs/Model/MyGetInvoiceDetailModel.dart';
import 'package:paper_drs/Model/myGetTodaysCollectionInvoiceListModel.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class DetailListScreen extends StatefulWidget {
  final MyGetTodaysCollectionInvoiceListModel itemData;
  const DetailListScreen({Key? key, required this.itemData}) : super(key: key);

  @override
  State<DetailListScreen> createState() => _DetailListScreenState();
}

class _DetailListScreenState extends State<DetailListScreen> {
  List<GetCategoryModel> getCategoryListtype = [];
  String categoryName = "";
  String categoryId = "";

  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  Future<bool> myGetCategoryList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');
    try {
      var uri = Uri.parse(GetCategory_API + "/GetData");
      var payload = json.encode({"SalesmanLoginId": userName.toString()});
      var response =
          await Dio().post(GetCategory_API + "/GetData", data: payload);
      print(response.data);

      if (response.statusCode == 200) {
        getCategoryListtype = List<GetCategoryModel>.from(
            response.data.map((x) => GetCategoryModel.fromJson(x)));
        getCategoryListtype.insert(
            0,
            GetCategoryModel(
                categoryId: "null", categoryName: "NA", active: 0));
        categoryName = getCategoryListtype.isNotEmpty
            ? getCategoryListtype[0].categoryName!
            : "";
        categoryId = getCategoryListtype.isNotEmpty
            ? getCategoryListtype[0].categoryId!.toString()
            : "";
        print("categoryType");
        print(categoryName);
        print("categoryType");
      } else {
        getCategoryListtype = [];
      }
    } catch (err) {
      print(err);
      getCategoryListtype = [];
    }
    setState(() {});

    return true;
  }

  Future<bool> myGetAmountForPayment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');
    try {
      var uri = Uri.parse(GetAmountForPayment_API + "/GetData");
      var payload = json.encode({
        "CategoryId": categoryId,
        "RetailerId": widget.itemData.retailerId,
        "SalesmanLoginId": userName.toString()
      });
      var response =
          await Dio().post(GetAmountForPayment_API + "/GetData", data: payload);
      print(response.data);

      if (response.statusCode == 200) {
        myAmountForPayment = List<AmountForPaymentModel>.from(
            response.data.map((x) => AmountForPaymentModel.fromJson(x)));
      } else {
        myAmountForPayment = [];
      }
    } catch (err) {
      print(err);
    }
    setState(() {});
    return true;
  }

  bool isSearch = false;

  Future myMyGetInvoiceDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');

    var uri = Uri.parse(GetPaymentLedger_API + "/GetInvoiceDetails");

    var payload = json.encode({
      "invoiceOrPayment": all == true
          ? ""
          : invoice == true
              ? "I"
              : payment == true
                  ? "P"
                  : "",
      "RetailerId": widget.itemData.retailerId,
      "category": categoryName == "NA" ? null : categoryName,
      "SalesmanLoginId": userName.toString(),
      "Issearch": !all
    });
    print("-------------------------------------");
    print(json.encode({
      "invoiceOrPayment": all == true
          ? ""
          : invoice == true
              ? "I"
              : payment == true
                  ? "P"
                  : "",
      "RetailerId": widget.itemData.retailerId,
      "category": categoryName == "NA" ? null : categoryName,
      "SalesmanLoginId": userName.toString(),
      "Issearch": !all
    }));
    print("-------------------------------------");

    var response = await Dio()
        .post(GetPaymentLedger_API + "/GetInvoiceDetails", data: payload);
    print(response.data);
    return response.data;
  }

  List<AmountForPaymentModel> myAmountForPayment = [];

  @override
  void initState() {
    super.initState();
    myGetCategoryList();
    myGetAmountForPayment();
  }

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> refreshList() async {
    refreshKey.currentState!.show();
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));

    return;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgound(
          child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Column(
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
                const Text(
                  "Customer Ledger",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
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
              widget.itemData.retailerCode!,
              style: const TextStyle(
                  color: MyColors.greyTitleColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
            ),
            Text(
              widget.itemData.retailerName!,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 13),
            ),
            SizedBox(
              height: 1.3060.h,
            ),
            topheaderDesign(),
            SizedBox(
              height: 1.8060.h,
            ),
            Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: Colors.white,
              child: filterRowDesign(),
            ),
            SizedBox(
              height: 1.8060.h,
            ),
            Expanded(
              child: RefreshIndicator(
                key: refreshKey,
                onRefresh: refreshList,
                child: FutureBuilder(
                  future: myMyGetInvoiceDetail(),
                  builder: (context, AsyncSnapshot s) {
                    print("object");
                    print(s);
                    if (s.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (s.hasData &&
                        s.connectionState == ConnectionState.done) {
                      List<MyGetInvoiceDetailModel> items =
                          List<MyGetInvoiceDetailModel>.from(s.data
                              .map((x) => MyGetInvoiceDetailModel.fromJson(x)));
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

  bool all = true, invoice = false, payment = false;

  Widget filterRowDesign() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                all = true;
                invoice = false;
                payment = false;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 5.1576.h,
              decoration: BoxDecoration(
                color: all == true ? const Color(0xffF4BB45) : Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                "All",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                all = false;
                invoice = true;
                payment = false;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 5.1576.h,
              decoration: BoxDecoration(
                color: invoice == true ? const Color(0xffF4BB45) : Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                "Invoices",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() {
                all = false;
                invoice = false;
                payment = true;
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 5.1576.h,
              decoration: BoxDecoration(
                color: payment == true ? const Color(0xffF4BB45) : Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: const Text(
                "Payments",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget listBuildDesign(List<MyGetInvoiceDetailModel> items) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  if (items[index].key!.toLowerCase().trim() == "bill number") {
                    if (items[index]
                        .billNumber!
                        .toString()
                        .toLowerCase()
                        .trim()
                        .startsWith("cr")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InvoiceDetailListScreen(
                                    crNumber: items[index].billNumber!,
                                    retailerName: widget.itemData.retailerName!,
                                    retailercode: widget.itemData.retailerCode!,
                                  )));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InvoiceDetailScreen(),
                          ));
                    }
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvoiceDetailScreen(),
                        ));
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50.w,
                                  child: Text(
                                    items[index].key!.toLowerCase().trim() ==
                                            "bill number"
                                        ? items[index].billNumber!
                                        : items[index].key!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color:
                                            hexToColor(items[index].colorCode!),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  items[index].rowDate!,
                                  style: TextStyle(
                                      color:
                                          hexToColor(items[index].colorCode!),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "₹ ${numberFormat.format((items[index].value!.round()))}/-  ",
                            style: TextStyle(
                                color: hexToColor(items[index].colorCode!),
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
                                color: hexToColor(items[index].colorCode!)),
                          )
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
        });
  }

  Widget topheaderDesign() {
    return Column(
      children: [
        Row(
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
                        child: Image.asset(menu),
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "Category",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            height: 25,
                            width: 100,
                            child: categoryName == ""
                                ? const Text(
                                    "Test",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  )
                                : DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      alignment: Alignment.centerRight,
                                      iconSize: 0,
                                      isExpanded: true,
                                      elevation: 0,
                                      hint: (categoryName == "")
                                          ? const Text("")
                                          : Text("$categoryName"),
                                      style: (categoryName == "")
                                          ? TextStyle(
                                              color: Colors.grey[500],
                                            )
                                          : const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                      value: categoryName == ""
                                          ? null
                                          : categoryName,
                                      items: getCategoryListtype.map((cate) {
                                        return DropdownMenuItem(
                                          alignment: Alignment.centerRight,
                                          child: Text(cate.categoryName!),
                                          value: cate.categoryName,
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        setState(() {
                                          categoryName = value.toString();
                                          for (var i = 0;
                                              i < getCategoryListtype.length;
                                              i++) {
                                            if (getCategoryListtype[i]
                                                    .categoryName ==
                                                categoryName) {
                                              categoryId =
                                                  getCategoryListtype[i]
                                                      .categoryId
                                                      .toString();
                                            }
                                          }
                                        });
                                        print("dcsf $categoryName");
                                      },
                                    ),
                                  ),
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
              child: InkWell(
                onTap: () {
                   {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MakePaymentScreen(
                            amountBalance: double.parse(
                                    myAmountForPayment[0].amountForPayment!)
                                .round().abs()
                                .toString(),
                            retailerId: widget.itemData.retailerId!.toString(),
                            colorCode: widget.itemData.colorCode!,
                            retailerName: widget.itemData.retailerName!,
                            categoryId: categoryId,
                            retailercode: widget.itemData.retailerCode!,
                          ),
                        ));
                  // } else {
                  //   Fluttertoast.showToast(msg: "Unable to make payment");
                  }
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
                              "Make Payament",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            myAmountForPayment.isNotEmpty
                                ? Text(
                                    "₹ ${numberFormat.format((double.parse(myAmountForPayment[0].amountForPayment!).round()))}/-",
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
}
