// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:paper_drs/AppScreen/Splash_Screen.dart';
import 'package:paper_drs/Contants/app_contant.dart';
import 'package:paper_drs/Contants/const_tant.dart';
import 'package:paper_drs/Contants/image_constant.dart';
import 'package:paper_drs/Model/myProfileDetail.dart';
import 'package:paper_drs/Widget/CommonBackground.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

var salesmanName = "";

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({Key? key}) : super(key: key);

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  Future myGetProfile() async {
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
    return response.data;
  }

  Widget profilePhotoMaker(logo) {
    try {
      if (logo == null || logo == "") {
        print("{}{}{}{}{}{}{}{{}{}{{{{{{{{{{{{{{{{{{{{{{{");
        return Container(
          margin: EdgeInsets.only(
            top: 4.h,
          ),
          height: 15.5625.h,
          width: 15.5625.h,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 12, spreadRadius: 7, color: Colors.black26)
              ],
              image: DecorationImage(
                  image: AssetImage(profileImage), fit: BoxFit.fill)),
        );
      } else {
        Uint8List _bytes;
        _bytes = Base64Decoder().convert(logo);
        return Container(
          margin: EdgeInsets.only(
            top: 4.h,
          ),
          height: 15.5625.h,
          width: 15.5625.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    blurRadius: 12, spreadRadius: 7, color: Colors.black26)
              ],
              image: DecorationImage(
                  image: MemoryImage(_bytes), fit: BoxFit.fill)),
        );
      }
    } catch (err) {
      print("error");
      return Container(
        margin: EdgeInsets.only(
          top: 4.h,
        ),
        height: 15.5625.h,
        width: 15.5625.h,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 12, spreadRadius: 7, color: Colors.black26)
            ],
            image: DecorationImage(
                image: AssetImage(profileImage), fit: BoxFit.fill)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgound(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 4.3060.h,
            ),
            Row(
              children: [
                const Text(
                  "User Profile",
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
            FutureBuilder(
              future: myGetProfile(),
              builder: (context, AsyncSnapshot s) {
                if (s.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (s.hasData &&
                    s.connectionState == ConnectionState.done) {
                  List<MyGetProfileModel> items = List<MyGetProfileModel>.from(
                      s.data.map((x) => MyGetProfileModel.fromJson(x)));

                  print(items.length);
                  return items.isEmpty
                      ? const Center(
                          child: Text(
                          "Something went wrong...",
                          style: TextStyle(color: Colors.black),
                        ))
                      : Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 12.412197.h,
                                  child: Row(
                                    children: [
                                      const Spacer(),
                                      InkWell(
                                          onTap: () async {
                                            SharedPreferences prefs =
                                                await SharedPreferences
                                                    .getInstance();

                                            prefs.clear();
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SplashScreen(),
                                                ));
                                          },
                                          child: Image.asset(logout))
                                    ],
                                  ),
                                ),
                                Material(
                                  elevation: 15,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(children: [
                                      SizedBox(
                                        height: 9.412197.h,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffF4BB45),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Image.asset(profile),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Name",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      items[0].salesmanName!,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffF4BB45),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Image.asset(idCard),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Salesman ID",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      items[0].salesmanSysId!,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffF4BB45),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Image.asset(building),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      "Company Name ",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "Cartrail Trade Hub Pvt. Ltd",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffF4BB45),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Image.asset(companyId),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      "Company ID ",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      "CRAA0003",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color(0xffF4BB45),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10),
                                                    ),
                                                  ),
                                                  child: Image.asset(phone),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      "Phone",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(
                                                      height: 3,
                                                    ),
                                                    Text(
                                                      items[0].mobileNumber! ==
                                                              "0"
                                                          ? ""
                                                          : "+91 ${items[0].mobileNumber!}",
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Image.asset(qr),
                                      ),
                                      const Text(
                                        "CRAA003 Payment QR code",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                    ]),
                                  ),
                                )
                              ],
                            ),
                            Align(
                                alignment: Alignment.topCenter,
                                child: profilePhotoMaker(items[0].photo!)),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 82.h,
                                ),
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
                          ],
                        );
                }

                return const Center(
                    child: Text(
                  "OOPS! NO DATA!",
                  style: TextStyle(color: Colors.black),
                ));
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      )),
    );
  }
}
