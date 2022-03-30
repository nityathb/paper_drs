import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:paper_drs/AppScreen/MainDashBoard.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/GetMyBankModel.dart';
import 'package:paper_drs/Model/SuccessResultModel.dart';

import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class BankAcceptPaymentScreen extends StatefulWidget {
  int amount;
  String retailercode,
      categoryId,
      retailerName,
      colorCode,
      retailerId,
      amountBalance;
  BankAcceptPaymentScreen(
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
  State<BankAcceptPaymentScreen> createState() =>
      _BankAcceptPaymentScreenState();
}

class _BankAcceptPaymentScreenState extends State<BankAcceptPaymentScreen> {
  List<GetBankModel> getBankListtype = [];
  String BankName = "";
  String BankId = "";

  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');

  Future<bool> myGetBankList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userName = prefs.getString('UserName');
    var userTypeId = prefs.getString('UserTypeId');
    var companyId = prefs.getString('CompanyId');
    try {
      var uri = Uri.parse(Bank_API + "/GetBankList");
      var payload = json.encode({"SalesmanLoginId": userName.toString()});
      var response = await Dio().post(Bank_API + "/GetBankList", data: payload);
      print(response.data);

      if (response.statusCode == 200) {
        getBankListtype = List<GetBankModel>.from(
            response.data.map((x) => GetBankModel.fromJson(x)));
        BankName =
            getBankListtype.isNotEmpty ? getBankListtype[0].BankName! : "";
        BankId = getBankListtype.isNotEmpty
            ? getBankListtype[0].BankId!.toString()
            : "";
        print("BankType");
        print(BankName);
        print("BankType");
      } else {
        getBankListtype = [];
      }
    } catch (err) {
      print(err);
      getBankListtype = [];
    }
    setState(() {});

    return true;
  }

  @override
  void initState() {
    super.initState();
    myGetBankList();
  }

  TextEditingController refController = TextEditingController();
  TextEditingController BankNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  PickedFile? _image;
  int groupVal = 1;
  DateTime instumentDate = DateTime.now();
  Future<void> _selectStartValidDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      print("date: $picked");
      setState(() {
        instumentDate = picked;
      });
    }
  }

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
                  "Bank Registration",
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 75,
                            width: 60,
                            child: Image.asset(
                              bankIcon,
                              height: 75,
                              width: 60,
                              color: MyColors.brownTitleColor,
                            ),
                          ),
                          const Text(
                            "Bank Payment",
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
                      SizedBox(
                        height: .8.h,
                      ),
                      checkBoxRow(),
                      SizedBox(
                        height: .8.h,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Reference Number",
                            style: TextStyle(
                                color: MyColors.greyTitleColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        child: TextFormField(
                          controller: refController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter reference no.';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: Container(
                                margin: const EdgeInsets.all(5),
                                padding: EdgeInsets.all(7),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColors.yellowTitleColor),
                                child: const Text(
                                  "#",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: .8.h,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Instrument Date",
                            style: TextStyle(
                                color: MyColors.greyTitleColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 45,
                        child: TextField(
                          readOnly: true,
                          controller: TextEditingController(
                              text: DateFormat("dd-MM-yyyy")
                                  .format(instumentDate)),
                          onTap: () async {
                            await _selectStartValidDate(
                              context,
                            );

                            setState(() {});
                          },
                          decoration: InputDecoration(
                              suffixIcon: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: MyColors.yellowTitleColor),
                                  child: Image.asset(
                                    dateIcon,
                                    color: Colors.black,
                                  )),
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black38),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: .8.h,
                      ),
                      Row(
                        children: const [
                          Text(
                            "Bank Name",
                            style: TextStyle(
                                color: MyColors.greyTitleColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: BankName == ""
                                    ? const Text(
                                        "Test",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          iconSize: 0,
                                          isExpanded: true,
                                          elevation: 0,
                                          hint: (BankName == "")
                                              ? const Text("")
                                              : Text("$BankName"),
                                          style: (BankName == "")
                                              ? TextStyle(
                                                  color: Colors.grey[500],
                                                )
                                              : const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold),
                                          value:
                                              BankName == "" ? null : BankName,
                                          items: getBankListtype.map((cate) {
                                            return DropdownMenuItem(
                                              child: Text(cate.BankName!),
                                              value: cate.BankName,
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              BankName = value.toString();
                                              for (var i = 0;
                                                  i < getBankListtype.length;
                                                  i++) {
                                                if (getBankListtype[i]
                                                        .BankName ==
                                                    BankName) {
                                                  BankId = getBankListtype[i]
                                                      .BankId
                                                      .toString();
                                                }
                                              }
                                            });
                                            print("dcsf $BankName");
                                          },
                                        ),
                                      ),
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColors.yellowTitleColor),
                                child: Image.asset(
                                  bankIcon,
                                  height: 20,
                                  width: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          )),
                      groupVal == 3
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: .8.h,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Cheque Image Upload",
                                      style: TextStyle(
                                          color: MyColors.greyTitleColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 45,
                                  child: TextField(
                                    onTap: () => getImageFromCamera(),
                                    obscureText: true,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: "Image Upload",
                                        suffixIcon: Container(
                                          margin: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: MyColors.yellowTitleColor),
                                          child: const Icon(
                                            Icons.image,
                                            color: Colors.black,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.black38),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.3060.h,
                                ),
                                _image == null
                                    ? const SizedBox()
                                    : Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            image: DecorationImage(
                                                image: FileImage(
                                                    File(_image!.path)))),
                                      )
                              ],
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 3.8060.h,
                      ),
                      InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              groupVal == 3
                                  ? _image == null
                                      ? Fluttertoast.showToast(
                                          msg: "Please attach cueque image")
                                      : update_Cheque_StatusAPI(_image)
                                  : update_UPIandBank_StatusAPI();
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please enter proper payment details");
                            }
                          },
                          child: Container(
                              height: 45,
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: MyColors.greenTitleColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Future getImageFromCamera() async {
    try {
      _image = await ImagePicker()
          .getImage(source: ImageSource.camera, imageQuality: 70);
      setState(() {});
    } catch (err) {
      Fluttertoast.showToast(msg: "Something went wrong. Try after sometime.");
      setState(() {
        _image = null;
      });
    }
  }

  Widget checkBoxRow() {
    return Material(
        color: Colors.transparent,
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
                          unselectedWidgetColor: MyColors.purpleTitleColor,
                        ),
                        child: Radio(
                          groupValue: groupVal,
                          activeColor: MyColors.purpleTitleColor,
                          value: 1,
                          onChanged: (value) {
                            setState(() {
                              _image = null;
                              groupVal = int.parse(value.toString());
                            });
                          },
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "UPI ",
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
                        unselectedWidgetColor: MyColors.purpleTitleColor,
                      ),
                      child: Radio(
                        groupValue: groupVal,
                        activeColor: MyColors.purpleTitleColor,
                        value: 2,
                        onChanged: (value) {
                          setState(() {
                            _image = null;
                            groupVal = int.parse(value.toString());
                          });
                        },
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Bank Transfer",
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
                        unselectedWidgetColor: MyColors.purpleTitleColor,
                      ),
                      child: Radio(
                        groupValue: groupVal,
                        activeColor: MyColors.purpleTitleColor,
                        value: 3,
                        onChanged: (value) {
                          setState(() {
                            groupVal = int.parse(value.toString());
                          });
                        },
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Cheque",
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

  update_UPIandBank_StatusAPI() async {
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
        'POST', Uri.parse(ReceivedChequePayment_API + "/ReceiveChequePayment"));

    request.fields["CompanyId"] = "0";
    request.fields["AmountReceived"] = "${widget.amount}";
    request.fields["BankDetail"] = BankName;
    request.fields["InstrumentNumber"] = "5666";
    request.fields["Otp"] = "12345";
    request.fields["SalesmanLoginId"] = userName.toString();
    request.fields["categoryId"] = "0";
    request.fields["PaymentReceivedDate"] =
        DateFormat("yyyy-MM-dd").format(instumentDate).toString();
    request.fields["RetailerId"] = widget.retailerId;
    request.fields["SalesmanId"] = userId!;
    request.fields["RetailerInvoiceId"] = refController.text;
    request.fields["InstrumentDate"] =
        DateFormat("yyyy-MM-dd").format(instumentDate).toString();
    request.fields["ChequeNumber"] = "";
    request.fields["ChequeDate"] =
        DateFormat("yyyy-MM-dd").format(instumentDate).toString();
    request.fields["BankId"] = BankId;
    request.fields["PaymentMode"] = groupVal == 1 ? "UPI" : "Bank Transfer";
    print(json.encode(request.fields));
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    var decodedData = jsonDecode(res.body);
    print(decodedData);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(res.body);
      print(decodedData);
      SuccessResultModel mySuccessResultModel =
          SuccessResultModel.fromJson(decodedData);
      Navigator.pop(context);
      pymentSuccessfulBankPopUp(
          companyId, userName, mySuccessResultModel.referenceNumber);

      setState(() {});
    } else if (response.statusCode == 401) {
      var decodedData = jsonDecode(res.body);
      setState(() {
        _image = null;
      });
      Fluttertoast.showToast(msg: decodedData['message']);
      Navigator.pop(context);
    } else {
      print(res.statusCode);
      setState(() {
        _image = null;
      });

      Fluttertoast.showToast(msg: "Please try after some time");
      Navigator.pop(context);
    }
  }

  update_Cheque_StatusAPI(PickedFile? _image) async {
    if (_image == null) {
      Fluttertoast.showToast(msg: "Photo not clicked");
    } else {
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
      var request = http.MultipartRequest('POST',
          Uri.parse(ReceivedChequePayment_API + "/ReceiveChequePayment"));

      request.fields["CompanyId"] = "0";
      request.fields["AmountReceived"] = "${widget.amount}";
      request.fields["BankDetail"] = BankName;
      request.fields["InstrumentNumber"] = "5666";
      request.fields["Otp"] = "12345";
      request.fields["SalesmanLoginId"] = userName.toString();
      request.fields["categoryId"] = "0";
      request.fields["PaymentReceivedDate"] =
          DateFormat("yyyy-MM-dd").format(instumentDate).toString();
      request.fields["RetailerId"] = widget.retailerId;
      request.fields["SalesmanId"] = userId!;
      request.fields["RetailerInvoiceId"] = refController.text;
      request.fields["InstrumentDate"] =
          DateFormat("yyyy-MM-dd").format(instumentDate).toString();
      request.fields["ChequeNumber"] = refController.text;
      request.fields["ChequeDate"] =
          DateFormat("yyyy-MM-dd").format(instumentDate).toString();
      request.fields["BankId"] = BankId;
      request.fields["PaymentMode"] = "Cheque";
      print(json.encode(request.fields));
      request.files.add(await http.MultipartFile.fromPath('file', _image.path));
      var response = await request.send();
      final res = await http.Response.fromStream(response);
      var decodedData = jsonDecode(res.body);
      print(decodedData);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(res.body);
        print(decodedData);
        SuccessResultModel mySuccessResultModel =
            SuccessResultModel.fromJson(decodedData);
        Navigator.pop(context);
        pymentSuccessfulBankPopUp(
            companyId, userName, mySuccessResultModel.referenceNumber);

        setState(() {});
      } else if (response.statusCode == 401) {
        var decodedData = jsonDecode(res.body);
        setState(() {
          _image = null;
        });
        Fluttertoast.showToast(msg: decodedData['message']);
        Navigator.pop(context);
      } else {
        print(res.statusCode);
        setState(() {
          _image = null;
        });

        Fluttertoast.showToast(msg: "Please try after some time");
        Navigator.pop(context);
      }
    }
  }

  pymentSuccessfulBankPopUp(companyid, salesManId, refId) {
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
                                        money, "Payment Mode",groupVal == 3?"Cheque":groupVal == 2?"Bank": "UPI"),
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
        tile == "Refrence No."
            ? SizedBox(
                width: 32.w,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: MyColors.blueTitleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              )
            : Text(
                subtitle,
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
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
