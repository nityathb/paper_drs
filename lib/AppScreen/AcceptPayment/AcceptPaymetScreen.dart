// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paper_drs/AppScreen/AcceptPayment/BankAcceptPaymentScreen.dart';
import 'package:paper_drs/AppScreen/AcceptPayment/CashAcceptPaymentScreen.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:sizer/sizer.dart';

class AcceptPaymentScreen extends StatefulWidget {
  String retailercode,
      categoryId,
      retailerName,
      colorCode,
      retailerId,
      amountBalance;
  AcceptPaymentScreen(
      {Key? key,
      required this.amountBalance,
      required this.categoryId,
      required this.retailerId,
      required this.colorCode,
      required this.retailerName,
      required this.retailercode})
      : super(key: key);

  @override
  State<AcceptPaymentScreen> createState() => _AcceptPaymentScreenState();
}

class _AcceptPaymentScreenState extends State<AcceptPaymentScreen> {
  TextEditingController controllerAmount = TextEditingController();
  String amountValue = "";
  @override
  void initState() {
    super.initState();
    amountValue = widget.amountBalance;
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
                  "Accept Payment",
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
                    const Text(
                      "Accept Payment",
                      style: TextStyle(
                          color: MyColors.brownTitleColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 2.3060.h,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: 150,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: SizedBox(
                          width: 150,
                          child: TextFormField(
                            style: const TextStyle(
                                color: MyColors.blueTitleColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: MyColors.blueTitleColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                              prefixStyle: TextStyle(
                                  color: MyColors.blueTitleColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                              prefix: Text(
                                "₹ ",
                                style: TextStyle(
                                    color: MyColors.blueTitleColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            ),
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (val) {
                              amountValue = val;
                            },
                            initialValue: widget.amountBalance,
                          ),
                        )),
                    SizedBox(
                      height: 2.3060.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              // if (double.parse(amountValue) <=
                              //     double.parse(widget.amountBalance)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CashAcceptPaymentScreen(
                                              amountBalance:
                                                  widget.amountBalance,
                                              retailerId: widget.retailerId,
                                              colorCode: widget.colorCode,
                                              retailerName: widget.retailerName,
                                              categoryId: widget.categoryId,
                                              retailercode: widget.retailercode,
                                              amount: double.parse(amountValue)
                                                  .round()),
                                    ));
                              // } else {
                              //   Fluttertoast.showToast(msg: "Limit exceed");
                              // }
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
                                  color: Color(0xff339966),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(children: [
                                  Image.asset(
                                    money,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      "Cash",
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
                            onTap: () {
                              // if (double.parse(amountValue) <=
                              //     double.parse(widget.amountBalance)) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          BankAcceptPaymentScreen(
                                              amountBalance:
                                                  widget.amountBalance,
                                              retailerId: widget.retailerId,
                                              colorCode: widget.colorCode,
                                              retailerName: widget.retailerName,
                                              categoryId: widget.categoryId,
                                              retailercode: widget.retailercode,
                                              amount: double.parse(amountValue)
                                                  .round()),
                                    ));
                              // } else {
                              //   Fluttertoast.showToast(msg: "Limit exceed");
                              // }
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
                                  color: Color(0xffDF3731),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Column(children: [
                                  Image.asset(
                                    bankCollection,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const FittedBox(
                                    child: Text(
                                      "Bank",
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
}
