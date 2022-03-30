// ignore_for_file: file_names, must_be_immutable, avoid_print
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/AppScreen/MainDashBoard.dart';
import 'package:paper_drs/AppScreen/RejectPayment/ShopCloseScreen.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class RejectPaymentScreen extends StatefulWidget {
  String retailercode,
      categoryId,
      retailerName,
      colorCode,
      retailerId,
      amountBalance;
  RejectPaymentScreen(
      {Key? key,
      required this.amountBalance,
      required this.categoryId,
      required this.retailerId,
      required this.colorCode,
      required this.retailerName,
      required this.retailercode})
      : super(key: key);
  @override
  State<RejectPaymentScreen> createState() => _RejectPaymentScreenState();
}

class _RejectPaymentScreenState extends State<RejectPaymentScreen> {
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
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
                  "Payment Rejected",
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
              height:1.2.h,
            ),
            Text(
              widget.retailercode,
              style: const TextStyle(
                  color: MyColors.greyTitleColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            Text(
              widget.retailerName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            SizedBox(
              height: 2.3060.h,
            ),
            Material(
              elevation: 5,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    buildSimpleCardPaymentDesign(),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              updateShopCloseStatusAPI();
                            },
                            child: Material(
                              elevation: 2,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: MyColors.yellowTitleColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(children: [
                                  Image.asset(cancelInvoice),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      "Payment Denied",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShopCloseScreen(
                                    amountBalance: widget.amountBalance,
                                    retailerId: widget.retailerId,
                                    colorCode: widget.colorCode,
                                    retailerName: widget.retailerName,
                                    categoryId: widget.categoryId,
                                    retailercode: widget.retailercode,
                                  ),
                                )),
                            child: Material(
                              elevation: 2,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: Color(0xffC4C4C4),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(children: [
                                  Image.asset(shopClose),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      "Shop Closed",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.8060.h,
            ),
          ],
        ),
      )),
    );
  }

  Widget buildSimpleCardPaymentDesign() {
    return Column(
      children: [
        Padding(
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
                        const Text(
                          "Closing Balance",
                          style: TextStyle(
                              color: MyColors.brownTitleColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),SizedBox(height: 5,),
                        Text(
                          DateFormat.yMMMMd('en_US').format(DateTime.now()) +
                              " " +
                              DateFormat.jm().format(DateTime.now()),
                          style: const TextStyle(
                              color: MyColors.brownTitleColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "₹ ${numberFormat.format((double.parse(widget.amountBalance).round()))}/-  ",
                    style: const TextStyle(
                        color: MyColors.brownTitleColor,
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
                        color: MyColors.brownTitleColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  updateShopCloseStatusAPI() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
                content: Row(
              children: const [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text("Please wait.."),
                ),
              ],
            )));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var companyId = prefs.getString('CompanyId');
    var request = http.MultipartRequest(
        'POST', Uri.parse(DeniedPayment_API + "DeniedReason"));

    request.fields["RetailerId"] = widget.retailerId;
    request.fields["CompanyId"] = "123456";
    request.fields["SalesmanId"] = userId ?? "";
    request.fields["DeniedReason"] = "Payment Denied";
    request.fields["SalesmanLoginId"] = userName ?? "";
    print(request.fields.toString());
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    print(res.body);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(res.body);
      print(decodedData);
      Navigator.pop(context);
      paymentDeinedPopUp(userName, companyId ?? "");

      setState(() {});
      // Fluttertoast.showToast(msg: "File Uploaded");
    } else if (response.statusCode == 401) {
      var decodedData = jsonDecode(res.body);
      // setState(() {
      //   _image = null;
      // });
      Fluttertoast.showToast(msg: decodedData['message']);
      Navigator.pop(context);
    } else {
      print(res.statusCode);
      // setState(() {
      //   _image = null;
      // });

      Fluttertoast.showToast(msg: "Please try after some time");
      Navigator.pop(context);
    }
  }

  paymentDeinedPopUp(userName, companyId) {
    return showDialog(
        context: context,
        builder: (context) => WillPopScope(
              onWillPop: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const MainDashBoard()),
                    (Route<dynamic> route) => false);
                return Future.value(true);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: MediaQuery.of(context).size.height * 0.35,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 20,
                          top: MediaQuery.of(context).size.height * 0.095,
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 2.94426.h,
                                          width: 27.940505.w,
                                          child: Image.asset(appLogo),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          icon: Icon(
                                            Icons.cancel,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            color: MyColors.primaryAppColor,
                                          ),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MainDashBoard()),
                                                    (Route<dynamic> route) =>
                                                        false);
                                          },
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(yellowCircle),
                                      )),
                                      child: Image.asset(
                                        cancelInvoice,
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    const Text(
                                      "Payment Denied",
                                      style: TextStyle(
                                          color: MyColors.brownTitleColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      widget.retailercode,
                                      style: const TextStyle(
                                          color: MyColors.greyTitleColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      widget.retailerName,
                                      style: const TextStyle(
                                          color: MyColors.blueTitleColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      DateFormat("yyyy-MM-dd")
                                              .format(DateTime.now()) +
                                          "_" +
                                          DateFormat("HH:mm")
                                              .format(DateTime.now()),
                                      style: const TextStyle(
                                          color: MyColors.greyTitleColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Company ID",
                                          style: TextStyle(
                                              color: MyColors.greyTitleColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Spacer(),
                                        Text(
                                          companyId.toString(),
                                          style: const TextStyle(
                                              color: MyColors.blueTitleColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Salesman ID",
                                          style: TextStyle(
                                              color: MyColors.greyTitleColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Spacer(),
                                        Text(
                                          userName.toString(),
                                          style: const TextStyle(
                                              color: MyColors.blueTitleColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.54,
                          right: MediaQuery.of(context).size.width * 0.30,
                          left: MediaQuery.of(context).size.width * 0.30,
                          child: Center(
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                height: 5.5625.h,
                                width: 5.5625.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColors.primaryAppColor,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 12,
                                        spreadRadius: 7,
                                        color: Colors.black26)
                                  ],
                                ),
                                child: const Icon(Icons.share),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
