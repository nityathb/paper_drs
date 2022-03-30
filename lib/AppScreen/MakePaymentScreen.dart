// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/AppScreen/AcceptPayment/AcceptPaymetScreen.dart';
import 'package:paper_drs/AppScreen/RejectPayment/RejectPaymetScreen.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:sizer/sizer.dart';

class MakePaymentScreen extends StatefulWidget {
  String retailercode,
      categoryId,
      retailerName,
      colorCode,
      retailerId,
      amountBalance;
  MakePaymentScreen(
      {Key? key,
      required this.amountBalance,
      required this.categoryId,
      required this.retailerId,
      required this.colorCode,
      required this.retailerName,
      required this.retailercode})
      : super(key: key);

  @override
  State<MakePaymentScreen> createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
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
                  "Payment Registration",
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
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AcceptPaymentScreen(
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
                                  color: Color(0xff339966),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(children: [
                                  Image.asset(acceptPayment),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      "Accept Payment",
                                      style: TextStyle(
                                          color: Colors.white,
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
                                  builder: (context) =>
                                       RejectPaymentScreen(


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
                                  color: Color(0xffDF3731),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(children: [
                                  Image.asset(rejectPayment),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      "Reject Payment",
                                      style: TextStyle(
                                          color: Colors.white,
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
                      color: MyColors.brownTitleColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
