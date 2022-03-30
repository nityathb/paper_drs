// To parse this JSON data, do
//
//     final myGetMeterModel = myGetMeterModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MyGetMeterModel> myGetMeterModelFromJson(String str) =>
    List<MyGetMeterModel>.from(
        json.decode(str).map((x) => MyGetMeterModel.fromJson(x)));

String myGetMeterModelToJson(List<MyGetMeterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetMeterModel {
  MyGetMeterModel({
    this.outstandingAmount,
    this.recevableAmount,
    this.percentageMeterValue,
  });

  String? outstandingAmount;
  String? recevableAmount;
  double? percentageMeterValue;

  factory MyGetMeterModel.fromJson(Map<String, dynamic> json) =>
      MyGetMeterModel(
        outstandingAmount: json["OutstandingAmount"].toString(),
        recevableAmount: json["RecevableAmount"].toString(),
        percentageMeterValue: double.parse(json["PercentageMeterValue"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "OutstandingAmount": outstandingAmount,
        "RecevableAmount": recevableAmount,
        "PercentageMeterValue": percentageMeterValue,
      };
}
