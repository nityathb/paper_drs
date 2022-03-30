// To parse this JSON data, do
//
//     final getCategoryModel = getCategoryModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<GetCategoryModel> getCategoryModelFromJson(String str) =>
    List<GetCategoryModel>.from(
        json.decode(str).map((x) => GetCategoryModel.fromJson(x)));

String getCategoryModelToJson(List<GetCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCategoryModel {
  GetCategoryModel({
    this.categoryId,
    this.categoryName,
    this.active,
  });

  String? categoryId;
  String? categoryName;
  int? active;

  factory GetCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryModel(
        categoryId: json["CategoryId"].toString(),
        categoryName: json["CategoryName"],
        active: json["Active"],
      );

  Map<String, dynamic> toJson() => {
        "CategoryId": categoryId,
        "CategoryName": categoryName,
        "Active": active,
      };
}
