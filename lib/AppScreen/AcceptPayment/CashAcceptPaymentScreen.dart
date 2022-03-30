// ignore_for_file: file_names, must_be_immutable, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/AppScreen/MainDashBoard.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/SuccessResultModel.dart';

import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class CashAcceptPaymentScreen extends StatefulWidget {
  int amount;
  String retailercode,
      categoryId,
      retailerName,
      colorCode,
      retailerId,
      amountBalance;
  CashAcceptPaymentScreen(
      {Key? key,
      required this.amountBalance,
      required this.categoryId,
      required this.retailerId,
      required this.colorCode,
      required this.retailerName,
      required this.amount,
      required this.retailercode})
      : super(key: key);

  @override
  State<CashAcceptPaymentScreen> createState() =>
      _CashAcceptPaymentScreenState();
}

class _CashAcceptPaymentScreenState extends State<CashAcceptPaymentScreen> {
  int twoThousandCount = 0;
  int twoThousandTotalAmount = 0;
  TextEditingController twoThousandController = TextEditingController();

  int fiveHundredCount = 0;
  int fiveHundredTotalAmount = 0;
  TextEditingController fiveHundredController = TextEditingController();

  int twoHundredCount = 0;
  int twoHundredTotalAmount = 0;
  TextEditingController twoHundredController = TextEditingController();

  int oneHundredCount = 0;
  int oneHundredTotalAmount = 0;
  TextEditingController oneHundredController = TextEditingController();

  int fiftyCount = 0;
  int fiftyTotalAmount = 0;
  TextEditingController fiftyController = TextEditingController();

  int tweentyCount = 0;
  int tweentyTotalAmount = 0;
  TextEditingController tweentyController = TextEditingController();

  int tenCount = 0;
  int tenTotalAmount = 0;
  TextEditingController tenController = TextEditingController();

  int coinCount = 0;
  int coinTotalAmount = 0;
  TextEditingController coinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgound(
          child: SingleChildScrollView(
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
                  "Cash Registration",
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
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 75,
                          child: Image.asset(
                            money,
                            color: MyColors.brownTitleColor,
                          ),
                        ),
                        const Text(
                          "Cash Payment",
                          style: TextStyle(
                              color: MyColors.brownTitleColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 14),
                        ),
                        const Spacer(),
                        Text(
                          "₹ ${widget.amount}/-  ",
                          style: const TextStyle(
                              color: MyColors.blueTitleColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: twoThousandController,
                      noteName: twoThousandRS,
                      totalAmount: twoThousandTotalAmount,
                      notecount: twoThousandCount,
                      callBack: (val) {
                        twoThousandCount = int.parse(val);
                        twoThousandTotalAmount = twoThousandCount * 2000;

                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            twoThousandCount = 0;
                            twoThousandTotalAmount = 0;
                            twoThousandController.clear();
                          });
                        } else {
                          setState(() {
                            twoThousandCount = int.parse(val);
                            twoThousandTotalAmount = twoThousandCount * 2000;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: fiveHundredController,
                      noteName: fiveHundredRS,
                      totalAmount: fiveHundredTotalAmount,
                      notecount: fiveHundredCount,
                      callBack: (val) {
                        fiveHundredCount = int.parse(val);
                        fiveHundredTotalAmount = fiveHundredCount * 500;
                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            fiveHundredCount = 0;
                            fiveHundredTotalAmount = 0;
                            fiveHundredController.clear();
                          });
                        } else {
                          setState(() {
                            fiveHundredCount = int.parse(val);
                            fiveHundredTotalAmount = fiveHundredCount * 500;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: twoHundredController,
                      noteName: twoHundredRS,
                      totalAmount: twoHundredTotalAmount,
                      notecount: twoHundredCount,
                      callBack: (val) {
                        twoHundredCount = int.parse(val);
                        twoHundredTotalAmount = twoHundredCount * 200;

                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            twoHundredCount = 0;
                            twoHundredTotalAmount = 0;
                            twoHundredController.clear();
                          });
                        } else {
                          setState(() {
                            twoHundredCount = int.parse(val);
                            twoHundredTotalAmount = twoHundredCount * 200;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: oneHundredController,
                      noteName: hundredRS,
                      totalAmount: oneHundredTotalAmount,
                      notecount: oneHundredCount,
                      callBack: (val) {
                        oneHundredCount = int.parse(val);
                        oneHundredTotalAmount = oneHundredCount * 100;
                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            oneHundredCount = 0;
                            oneHundredTotalAmount = 0;
                            oneHundredController.clear();
                          });
                        } else {
                          setState(() {
                            oneHundredCount = int.parse(val);
                            oneHundredTotalAmount = oneHundredCount * 100;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: fiftyController,
                      noteName: fiftyRS,
                      totalAmount: fiftyTotalAmount,
                      notecount: fiftyCount,
                      callBack: (val) {
                        fiftyCount = int.parse(val);
                        fiftyTotalAmount = fiftyCount * 50;
                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            fiftyCount = 0;
                            fiftyTotalAmount = 0;
                            fiftyController.clear();
                          });
                        } else {
                          setState(() {
                            fiftyCount = int.parse(val);
                            fiftyTotalAmount = fiftyCount * 50;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: tweentyController,
                      noteName: twentyRS,
                      totalAmount: tweentyTotalAmount,
                      notecount: tweentyCount,
                      callBack: (val) {
                        tweentyCount = int.parse(val);
                        tweentyTotalAmount = tweentyCount * 20;
                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            tweentyCount = 0;
                            tweentyTotalAmount = 0;
                            tweentyController.clear();
                          });
                        } else {
                          setState(() {
                            tweentyCount = int.parse(val);
                            tweentyTotalAmount = tweentyCount * 20;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: tenController,
                      noteName: tenRS,
                      totalAmount: tenTotalAmount,
                      notecount: tenCount,
                      callBack: (val) {
                        tenCount = int.parse(val);
                        tenTotalAmount = tenCount * 10;
                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            tenCount = 0;
                            tenTotalAmount = 0;
                            tenController.clear();
                          });
                        } else {
                          setState(() {
                            tenCount = int.parse(val);
                            tenTotalAmount = tenCount * 10;
                          });
                        }
                      },
                    ),
                    buildSimpleCashCardPaymentDesign(
                      controller: coinController,
                      noteName: "COIN",
                      totalAmount: coinTotalAmount,
                      notecount: coinCount,
                      callBack: (val) {
                        coinCount = int.parse(val);
                        coinTotalAmount = coinCount * 1;
                        if (widget.amount <
                            (twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)) {
                          Fluttertoast.showToast(msg: "Amount exceed");
                          setState(() {
                            coinCount = 0;
                            coinTotalAmount = 0;
                            coinController.clear();
                          });
                        } else {
                          setState(() {
                            coinCount = int.parse(val);
                            coinTotalAmount = coinCount * 1;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    SizedBox(
                      height: .8.h,
                    ),
                    SizedBox(
                      height: 3.8060.h,
                    ),
                    InkWell(
                        onTap: () {
                          if (widget.amount !=
                              (twoThousandTotalAmount +
                                  fiveHundredTotalAmount +
                                  twoHundredTotalAmount +
                                  oneHundredTotalAmount +
                                  fiftyTotalAmount +
                                  tweentyTotalAmount +
                                  tenTotalAmount +
                                  coinTotalAmount)) {
                            Fluttertoast.showToast(
                                msg: "Please collect complete payment");
                          } else {
                            paymentConfirmScreen();
                          }
                        },
                        child: Container(
                            height: 45,
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.amount !=
                                      (twoThousandTotalAmount +
                                          fiveHundredTotalAmount +
                                          twoHundredTotalAmount +
                                          oneHundredTotalAmount +
                                          fiftyTotalAmount +
                                          tweentyTotalAmount +
                                          tenTotalAmount +
                                          coinTotalAmount)
                                  ? MyColors.greyTitleColor
                                  : MyColors.greenTitleColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "TOTAL AMOUNT - ₹ ${(twoThousandTotalAmount +
                                fiveHundredTotalAmount +
                                twoHundredTotalAmount +
                                oneHundredTotalAmount +
                                fiftyTotalAmount +
                                tweentyTotalAmount +
                                tenTotalAmount +
                                coinTotalAmount)}/- ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildSimpleCashCardPaymentDesign(
      {required String noteName,
      required int totalAmount,
      required int notecount,
      required TextEditingController controller,
      required Function(String) callBack}) {
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
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  noteName == "COIN"
                      ? Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 27,
                                child: Image.asset(
                                  oneRs,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 27,
                                child: Image.asset(
                                  twoRS,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 27,
                                child: Image.asset(
                                  fiveRS,
                                ),
                              ),
                            ],
                          ))
                      : SizedBox(
                          height: 40,
                          width: 100,
                          child: Image.asset(
                            noteName,
                          ),
                        ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      multiply,
                    ),
                  ),
                  SizedBox(
                      height: 40,
                      width: 75,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: false, signed: false),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (val) {
                          callBack(val);
                        },
                        controller: controller,
                        maxLength: 4,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: MyColors.blueTitleColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: const TextStyle(
                                color: MyColors.blueTitleColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.black38),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      )),
                  const Spacer(),
                  FittedBox(
                    child: Text(
                      "₹ $totalAmount/-  ",
                      style: const TextStyle(
                          color: MyColors.blueTitleColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
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

  paymentConfirmScreen() async {
    callingLoader();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var companyId = prefs.getString('CompanyId');
    try {
      var payload = json.encode({
        "CompanyId": "0",
        "AmountReceived": "${widget.amount}",
        "BankDetail": "",
        "InstrumentNumber": "1234",
        "Otp": "12345",
        "SalesmanLoginId": userName.toString(),
        "PhotoUpload": "",
        "PaymentReceivedDate":
            DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
        "RetailerId": widget.retailerId,
        "SalesmanId": userId,
        "RetailerInvoiceId": null,
        "InstrumentDate":
            DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
        "ChequeNumber": "",
        "ChequeDate": "",
        "categoryId": widget.categoryId,
        "PaymentMode": "Cash"
      });
      print(json.encode({
        "CompanyId": "0",
        "AmountReceived": "${widget.amount}",
        "BankDetail": "",
        "InstrumentNumber": "1234",
        "Otp": "12345",
        "SalesmanLoginId": userName.toString(),
        "PhotoUpload": "",
        "PaymentReceivedDate":
            DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
        "RetailerId":widget.retailerId,
        "SalesmanId": userId,
        "RetailerInvoiceId": null,
        "InstrumentDate":
            DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
        "ChequeNumber": "",
        "ChequeDate": "",
        "categoryId": widget.categoryId,
        "PaymentMode": "Cash"
      }));
      var response = await Dio()
          .post(ReceivedCashPayment_API + "/ReceiveCashPayment", data: payload);
      print(response.data);
      SuccessResultModel mySuccessResultModel =
          SuccessResultModel.fromJson(response.data);
      if (mySuccessResultModel.errorCode == "200") {
        Navigator.pop(context);

        pymentSuccessfulPopUp(
            companyId, userName, mySuccessResultModel.referenceNumber);
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Something went wrong...");
      }
    } catch (err) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Server Error...");
      print(err);
    }
  }

  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  pymentSuccessfulPopUp(companyid, salesManId, refId) {
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
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width * 0.85,
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
                                    MediaQuery.of(context).size.height * 0.65,
                                width: MediaQuery.of(context).size.width * 0.85,
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
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(greenPayment),
                                    ),
                                    const Text(
                                      "Payment Successful",
                                      style: TextStyle(
                                          color: MyColors.greenTitleColor,
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
                                      height: 15,
                                    ),
                                    mainSecondaryCard(
                                        invoice,
                                        "Amount Received",
                                        "₹ ${numberFormat.format((double.parse(widget.amount.toString()).round()))}/-"),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    mainSecondaryCard(
                                        billRS, "Refrence No.", refId),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    mainSecondaryCard(
                                      calender,
                                      "Date",
                                      DateFormat("yyyy-MM-dd")
                                              .format(DateTime.now()) +
                                          "_" +
                                          DateFormat("HH:mm")
                                              .format(DateTime.now()),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    mainSecondaryCard(
                                        money, "Payment Mode", "Cash"),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    mainSecondaryCard(companyId, "Company ID",
                                        companyid ?? ""),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    mainSecondaryCard(
                                        idCard, "Salesman ID", salesManId),
                                  ],
                                )),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.79,
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

  mainSecondaryCard(String imageName, tile, subtitle) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 5.2576.h,
          width: 10.96760.w,
          decoration: const BoxDecoration(
            color: Color(0xffF4BB45),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Image.asset(
            imageName,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          tile,
          style: const TextStyle(
              color: Colors.black38, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        Text(
          subtitle,
          style: const TextStyle(
              color: MyColors.blueTitleColor,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
