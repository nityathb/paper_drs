// To parse this JSON data, do
//
//     final myGetTodaysReceiveableModel = myGetTodaysReceiveableModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<MyGetTodaysReceiveableModel> myGetTodaysReceiveableModelFromJson(
        String str) =>
    List<MyGetTodaysReceiveableModel>.from(
        json.decode(str).map((x) => MyGetTodaysReceiveableModel.fromJson(x)));

String myGetTodaysReceiveableModelToJson(
        List<MyGetTodaysReceiveableModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyGetTodaysReceiveableModel {
  MyGetTodaysReceiveableModel({
    this.todaysReceivable,
  });

  double? todaysReceivable;

  factory MyGetTodaysReceiveableModel.fromJson(Map<String, dynamic> json) =>
      MyGetTodaysReceiveableModel(
        todaysReceivable: json["TodaysReceivable"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "TodaysReceivable": todaysReceivable,
      };
}
