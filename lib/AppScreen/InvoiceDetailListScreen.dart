// ignore_for_file: file_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Contants/options_constant.dart';
import 'package:paper_drs/Model/MyCRGetInvoiceDetailModel.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class ChipDataModel {
  String? imgName;
  String? date;
  String? title;
  String? mainTitle;
  ChipDataModel({this.date, this.imgName, this.mainTitle, this.title});
}

class InvoiceDetailListScreen extends StatelessWidget {
  String retailercode, crNumber, retailerName;
  InvoiceDetailListScreen(
      {Key? key,
      required this.crNumber,
      required this.retailerName,
      required this.retailercode})
      : super(key: key);
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  Future myMyGetInvoiceCRDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('UserId');
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');

    var uri = Uri.parse(GetInvoiceDetails_API + "/GetInvoiceDetails");

    var payload = json.encode({
      "SalesmanId": "10",
      "CompanyId": "0",
      "SalesmanLoginId": "PDAA00037",
      "BillNumber": "CR2230918"
    });
    print("-------------------------------------");
    print(json.encode({
      "SalesmanId": userId.toString(),
      "CompanyId": "0",
      "SalesmanLoginId": userName.toString(),
      "BillNumber": "CR2230918"
    }));
    print("-------------------------------------");

    var response = await Dio()
        .post(GetInvoiceDetails_API + "/GetInvoiceDetails", data: payload);
    print(response.data);
    return response.data;
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
                Text(
                  crNumber,
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
              retailercode,
              style: const TextStyle(
                  color: MyColors.greyTitleColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            Text(
              retailerName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            SizedBox(
              height: 2.3060.h,
            ),
            FutureBuilder(
              future: myMyGetInvoiceCRDetail(),
              builder: (context, AsyncSnapshot s) {
                print("object");
                print(s);
                if (s.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (s.hasData &&
                    s.connectionState == ConnectionState.done) {
                  List<MyCrGetInvoiceDetailModel> items =
                      List<MyCrGetInvoiceDetailModel>.from(s.data
                          .map((x) => MyCrGetInvoiceDetailModel.fromJson(x)));
                  print(items.length);

                  if (items.isEmpty) {
                    return const Center(
                        child: Text(
                      "No data found",
                      style: TextStyle(color: Colors.black),
                    ));
                  } else {
                    List<ChipDataModel> itemData = [];
                    itemData.add(ChipDataModel(
                      date: items[0].billDate,
                      imgName: invoice,
                      mainTitle: crNumber,
                      title: "Invoice Number",
                    ));
                    itemData.add(ChipDataModel(
                      date: "",
                      imgName: calender,
                      mainTitle: items[0].billDate,
                      title: "Invoice Date",
                    ));
                    itemData.add(ChipDataModel(
                      date: DateFormat("dd-MM-yyyy")
                          .format(DateTime.parse(items[0].lastPaymentDate!))
                          .toString(),
                      imgName: billRS,
                      mainTitle:
                          "₹ ${numberFormat.format((items[0].netAmount!.round()))}/-"
                              .toString(),
                      title: "Net Amount",
                    ));
                    itemData.add(ChipDataModel(
                      date: DateFormat("dd-MM-yyyy")
                          .format(DateTime.parse(items[0].lastPaymentDate!))
                          .toString(),
                      imgName: srIcon,
                      mainTitle:
                          "₹ ${numberFormat.format((items[0].salesReturn!.round()))}/-"
                              .toString(),
                      title: "Sale Return",
                    ));
                    itemData.add(ChipDataModel(
                      date: DateFormat("dd-MM-yyyy")
                          .format(DateTime.parse(items[0].lastPaymentDate!))
                          .toString(),
                      imgName: exIcon,
                      mainTitle: "₹ 0/-",
                      title: "Expiry",
                    ));
                    itemData.add(ChipDataModel(
                      date: DateFormat("dd-MM-yyyy")
                          .format(DateTime.parse(items[0].lastPaymentDate!))
                          .toString(),
                      imgName: cnIcon,
                      mainTitle:
                          "₹ ${numberFormat.format((items[0].creditAdjustment!.round()))}/-"
                              .toString(),
                      title: "Credit Note",
                    ));

                    return Material(
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
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: itemData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
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
                                      child: Image.asset(
                                        itemData[index].imgName!,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          itemData[index].title!,
                                          style: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        itemData[index].date == ""
                                            ? SizedBox()
                                            : const SizedBox(
                                                height: 3,
                                              ),
                                        itemData[index].date == ""
                                            ? SizedBox()
                                            : Text(
                                                itemData[index].date!,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      itemData[index].mainTitle!,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )),
                    );
                  }
                }

                return const Center(
                    child: Text(
                  "OOPS! NO DATA!",
                  style: TextStyle(color: Colors.black),
                ));
              },
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
