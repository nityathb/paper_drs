// To parse this JSON data, do
//
//     final myGetTodaysCashChequeCollectionReportModel = myGetTodaysCashChequeCollectionReportModelFromJson(jsonString);

// ignore_for_file: file_names


class MyGetTodaysCashChequeCollectionReportModel {
  MyGetTodaysCashChequeCollectionReportModel({
    this.paymentId,
    this.retailerName,
    this.retailerCode,
    this.paymentType,
    this.paymentReceivedDate,
    this.cash,
    this.cheque,
    this.colorCode,
  });

  int? paymentId;
  String? retailerName;
  String? retailerCode;
  String? paymentType;
  String? paymentReceivedDate;
  double? cash;
  double? cheque;
  String? colorCode;

  factory MyGetTodaysCashChequeCollectionReportModel.fromJson(
          Map<String, dynamic> json) =>
      MyGetTodaysCashChequeCollectionReportModel(
        paymentId: json["PaymentId"],
        retailerName: json["RetailerName"],
        retailerCode: json["RetailerCode"],
        paymentType: json["PaymentType"],
        paymentReceivedDate: json["PaymentReceivedDate"],
        cash: json["Cash"],
        cheque: json["Cheque"],
        colorCode: json["ColorCode"],
      );
}
