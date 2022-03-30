// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paper_drs/AppScreen/MainDashBoard.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/myProfileDetail.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<Offset> fade1;
  late AnimationController fcontroller1;
  late Animation<double> fade2;
  late AnimationController fcontroller2;
  late Animation<Offset> fade3;
  late AnimationController fcontroller3;
  late Animation<double> fade4;
  late AnimationController fcontroller4;
  late Animation<double> fade5;
  late AnimationController fcontroller5;
  late Animation<double> fade6;
  late AnimationController fcontroller6;
  bool checker = false;
  bool checker1 = false;
  bool sizer = true;
  bool sizer2 = true;
  @override
  void initState() {
    super.initState();
    fcontroller1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    fade1 = Tween(begin: const Offset(0, 0), end: const Offset(0, 2))
        .animate(CurvedAnimation(parent: fcontroller1, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fcontroller1.stop();
          sizer = false;
        }
      });
    fcontroller2 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    fade2 = Tween(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: fcontroller2, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fcontroller2.stop();
        }
      });
    fcontroller3 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    fade3 = Tween(begin: const Offset(0, 1), end: const Offset(0, -0.5))
        .animate(CurvedAnimation(parent: fcontroller3, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fcontroller3.stop();
        }
      });
    fcontroller4 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    fade4 = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: fcontroller4, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fcontroller4.stop();
        }
      });
    fcontroller5 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3300));
    fade5 = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: fcontroller5, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fcontroller5.stop();
        }
      });
    fcontroller6 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    fade6 = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: fcontroller6, curve: Curves.linear))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fcontroller6.stop();
        }
      });
    getCurrentLocation();
  }

  Future<void> checker22() async {
    fcontroller1.forward();
    fcontroller2.forward();
    fcontroller3.forward();
    fcontroller4.forward();
  }

  Future<void> getCurrentLocation() async {
    try {
      InternetAddress.lookup('google.com').then((result) async {
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await Future.delayed(const Duration(seconds: 3));
          try {
            prefs.getBool('_isAuthenticate') ?? false
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainDashBoard(),
                    ))
                : checker22();
          } catch (error) {
            checker22();
          }
        } else {
          _showdialog();
        }
      }).catchError((error) {
        _showdialog();
      });
    } on SocketException catch (_) {
      _showdialog();
    }
  }

  void _showdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            height: 227,
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Image.asset(wifiIssue),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Network Error",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Please check the Connectivity",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => SystemChannels.platform
                      .invokeMethod('SystemNavigator.pop'),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: MyColors.yellowTitleColor,
                    ),
                    height: 50,
                    width: double.infinity,
                    child: const Text(
                      "Dismiss",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Future<void> checker21() async {
    fcontroller1.forward();
    fcontroller2.forward();
    fcontroller3.forward();
    fcontroller4.forward();
  }

  @override
  void dispose() {
    super.dispose();
    fcontroller1.dispose();
    fcontroller2.dispose();
    fcontroller3.dispose();
    fcontroller4.dispose();
    fcontroller5.dispose();
    fcontroller6.dispose();
  }

  String companyId = "", userId = "", otp = "";
  TextEditingController user = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController otpContoller = TextEditingController();
  late DateTime currentBackPressTime;
  FocusNode inputUserIdNode = FocusNode();
  FocusNode inputCompanyIdNode = FocusNode();
  FocusNode inputOTPNode = FocusNode();

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Tap again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    print(1.h);
    print(1.w);
    print(1.sp);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: CustomBackgound(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 339,
                  ),
                  Image.asset(
                    appLogo,
                    height: 9.510.h,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SlideTransition(
                    position: fade1,
                    child: FadeTransition(
                      opacity: fade2,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        height: sizer ? 25 : 0,
                        child: const Text(
                          "रिश्ता वहीं है, जहाँ जानकारी सही है",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeTransition(
                    opacity: fade5,
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      duration: const Duration(seconds: 1),
                      height: checker1 ? 80 : 0,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "User Id: ",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: MyColors.greyTitleColor,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              userId,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: SlideTransition(
                      position: fade3,
                      child: FadeTransition(
                        opacity: fade4,
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          margin: const EdgeInsets.only(
                            top: 0,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: sizer2 ? 135 : 75,
                              ),
                              sizer2
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "User ID",
                                          style: TextStyle(
                                              color: MyColors.greyTitleColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            print("object");
                                            FocusScope.of(context)
                                                .requestFocus(inputUserIdNode);
                                          },
                                          child: SizedBox(
                                              height: 45,
                                              child: TextFormField(
                                                onTap: () {
                                                  print("odsbject");
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          inputUserIdNode);
                                                },
                                                focusNode: inputUserIdNode,
                                                maxLength: 9,
                                                onChanged: (val) {
                                                  userId = val;
                                                },
                                                controller: user,
                                                decoration: InputDecoration(
                                                    counterText: "",
                                                    suffixIcon: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration:
                                                          const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: MyColors
                                                                  .yellowTitleColor),
                                                      child: const Icon(
                                                        Icons.person,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    hintStyle: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black38),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    )),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: const [
                                            Text(
                                              "Company Id",
                                              style: TextStyle(
                                                  color:
                                                      MyColors.greyTitleColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                            height: 45,
                                            child: TextFormField(
                                              maxLength: 8,
                                              onChanged: (val) {
                                                companyId = val;
                                              },
                                              controller: company,
                                              decoration: InputDecoration(
                                                  counterText: "",
                                                  suffixIcon: Container(
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: MyColors
                                                                .yellowTitleColor),
                                                    child: const Icon(
                                                      Icons.card_travel_sharp,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  )),
                                            )),
                                      ],
                                    )
                                  : Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "OTP",
                                          style: TextStyle(
                                              color: MyColors.greyTitleColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                            height: 45,
                                            child: TextFormField(
                                              onChanged: (val) {
                                                otp = val;
                                              },
                                              controller: otpContoller,
                                              decoration: InputDecoration(
                                                  suffixIcon: Container(
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: MyColors
                                                                .yellowTitleColor),
                                                    child: const Icon(
                                                      Icons.security,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color:
                                                                Colors.black38),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  )),
                                            )),
                                      ],
                                    ),
                              const SizedBox(
                                height: 35,
                              ),
                              SizedBox(
                                height: sizer2 ? 45 : 0,
                                child: InkWell(
                                    onTap: () {
                                      if (userId == "") {
                                        Fluttertoast.showToast(
                                            msg: "Please enter the user id");
                                      } else if (companyId == "") {
                                        Fluttertoast.showToast(
                                            msg: "Please enter the company id");
                                      } else {
                                        _sendSMS();
                                      }
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: MyColors.yellowTitleColor,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Text(
                                          "GET OTP",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ))),
                              ),
                              FadeTransition(
                                opacity: fade6,
                                child: SizedBox(
                                  height: checker ? 45 : 0,
                                  child: InkWell(
                                      onTap: () {
                                        _loginUser();
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: MyColors.yellowTitleColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Text(
                                            "LOGIN",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ))),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendSMS() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => AlertDialog(
                  content: Row(
                children: const [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("Sending OTP..."),
                  ),
                ],
              )));
      var response = await http.post(Uri.parse(SendSMS + 'Send'),
          headers: {"Content-type": "application/json", "Accept": "*/*"},
          body:
              json.encode({"SalesmanLoginId": userId, "ServerId": companyId}));
      var responseData = jsonDecode(response.body);
      print(responseData);
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "OTP sent!");
        Navigator.pop(context);
        checker = true;
        fcontroller6.forward();
        if (checker1 == false) {
          fcontroller5.forward();
          setState(() {
            checker1 = true;
          });
          setState(() {
            sizer2 = false;
          });
        } else if (checker1 == true) {
          fcontroller5.reverse();
          setState(() {
            checker1 = false;
            sizer2 = true;
          });
          setState(() {});
          checker21();
        }
      } else {
        Navigator.pop(context);
        _showFaileddialog("Something went wrong!");
      }
    }
  }

  Future<void> _loginUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (otp == "") {
      Fluttertoast.showToast(msg: "Please enter the OTP");
    } else {
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => AlertDialog(
                  content: Row(
                children: const [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("login..."),
                  ),
                ],
              )));
      var response = await http.post(Uri.parse(AUTH_API + 'Verify'),
          headers: {"Content-type": "application/json", "Accept": "*/*"},
          body: json.encode({
            "OTPNumber": otp,
            "SalesmanLoginId": userId,
            "ServerId": companyId
          }));
      print(response.body);
      var responseData = jsonDecode(response.body);
      print(responseData);
      if (response.statusCode == 200) {
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        prefs.setString('UserId', responseData[0]['SalesmanId'].toString());
        prefs.setString("UserName", responseData[0]['UserName'].toString());
        prefs.setString("UserTypeId", responseData[0]['UserTypeId'].toString());
        // prefs.setString(
        //     "CompanyName", responseData[0]['CompanyName'].toString());
        prefs.setString("CompanyId", companyId);
        // prefs.setString(
        //     "RegisteredMacId", responseData[0]['RegisteredMacId'].toString());

        prefs.setBool("_isAuthenticate", true);

        try {
          var userId = prefs.getString('UserId');
          var userName = prefs.getString('UserName');

          var payload = json.encode({
            "SalesmanId": userId.toString(),
            "SalesmanLoginId": userName.toString()
          });
          var response = await Dio()
              .post(GetSalesmanProfile_API + "/GetData", data: payload);
          print(response.data);
          if (response.statusCode == 200) {
            List<MyGetProfileModel> items = List<MyGetProfileModel>.from(
                response.data.map((x) => MyGetProfileModel.fromJson(x)));
            prefs.setString("name", items[0].salesmanName.toString());

            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainDashBoard(),
                ));
          } else {
            Navigator.pop(context);

            _showFaileddialog("Something went wrong.");
          }
        } catch (err) {
          Navigator.pop(context);

          _showFaileddialog("Something went wrong.");
        }
      } else {
        Navigator.pop(context);
        _showFaileddialog(responseData['Message']);
      }
    }
  }

  void _showFaileddialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            height: 227,
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Image.asset(failed),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Oh Snap!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: MyColors.redTitleColor,
                    ),
                    height: 50,
                    width: double.infinity,
                    child: const Text(
                      "Dismiss",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
