// To parse this JSON data, do
//
//     final myCrGetInvoiceDetailModel = myCrGetInvoiceDetailModelFromJson(jsonString);

import 'dart:convert';

List<MyCrGetInvoiceDetailModel> myCrGetInvoiceDetailModelFromJson(String str) =>
    List<MyCrGetInvoiceDetailModel>.from(
        json.decode(str).map((x) => MyCrGetInvoiceDetailModel.fromJson(x)));

String myCrGetInvoiceDetailModelToJson(List<MyCrGetInvoiceDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyCrGetInvoiceDetailModel {
  MyCrGetInvoiceDetailModel({
    this.retailerName,
    this.retailerInvoiceId,
    this.retailerId,
    this.retailerCode,
    this.retailerUniqueCode,
    this.companyId,
    this.paymentCollectionDate,
    this.billNumber,
    this.billDate,
    this.billType,
    this.billMode,
    this.deliveryStatus,
    this.salesmanId,
    this.categoryId,
    this.grossAmount,
    this.schemeDiscount,
    this.salesReturn,
    this.replacement,
    this.distributorDiscount,
    this.cashDiscount,
    this.windowDisplay,
    this.taxAmount,
    this.debitAdjustment,
    this.creditAdjustment,
    this.netAmount,
    this.amountReceived,
    this.outstandingAmount,
    this.isHide,
    this.uploadedDate,
    this.uploadedBy,
    this.penalty,
    this.lastPaymentDate,
    this.lastPaymentAmount,
  });

  String? retailerName;
  int? retailerInvoiceId;
  int? retailerId;
  String? retailerCode;
  String? retailerUniqueCode;
  int? companyId;
  String? paymentCollectionDate;
  String? billNumber;
  String? billDate;
  String? billType;
  String? billMode;
  String? deliveryStatus;
  int? salesmanId;
  int? categoryId;
  double? grossAmount;
  double? schemeDiscount;
  double? salesReturn;
  double? replacement;
  double? distributorDiscount;
  double? cashDiscount;
  double? windowDisplay;
  double? taxAmount;
  double? debitAdjustment;
  double? creditAdjustment;
  double? netAmount;
  double? amountReceived;
  double? outstandingAmount;
  int? isHide;
  String? uploadedDate;
  String? uploadedBy;
  String? penalty;
  String? lastPaymentDate;
  double? lastPaymentAmount;

  factory MyCrGetInvoiceDetailModel.fromJson(Map<String, dynamic> json) =>
      MyCrGetInvoiceDetailModel(
        retailerName: json["RetailerName"],
        retailerInvoiceId: json["RetailerInvoiceId"],
        retailerId: json["RetailerId"],
        retailerCode: json["RetailerCode"],
        retailerUniqueCode: json["RetailerUniqueCode"],
        companyId: json["CompanyId"],
        paymentCollectionDate: (json["PaymentCollectionDate"]),
        billNumber: json["BillNumber"],
        billDate: (json["BillDate"]),
        billType: json["BillType"],
        billMode: json["BillMode"],
        deliveryStatus: json["DeliveryStatus"],
        salesmanId: json["SalesmanId"],
        categoryId: json["CategoryId"],
        grossAmount: json["GrossAmount"],
        schemeDiscount: json["SchemeDiscount"],
        salesReturn: json["SalesReturn"],
        replacement: json["Replacement"],
        distributorDiscount: json["DistributorDiscount"],
        cashDiscount: json["CashDiscount"],
        windowDisplay: json["WindowDisplay"],
        taxAmount: json["TaxAmount"],
        debitAdjustment: json["DebitAdjustment"],
        creditAdjustment: json["CreditAdjustment"],
        netAmount: json["NetAmount"],
        amountReceived: json["AmountReceived"],
        outstandingAmount: json["OutstandingAmount"],
        isHide: json["IsHide"],
        uploadedDate: (json["UploadedDate"]),
        uploadedBy: json["UploadedBy"],
        penalty: json["Penalty"],
        lastPaymentDate: (json["LastPaymentDate"]),
        lastPaymentAmount: json["LastPaymentAmount"],
      );

  Map<String, dynamic> toJson() => {
        "RetailerName": retailerName,
        "RetailerInvoiceId": retailerInvoiceId,
        "RetailerId": retailerId,
        "RetailerCode": retailerCode,
        "RetailerUniqueCode": retailerUniqueCode,
        "CompanyId": companyId,
        "PaymentCollectionDate": paymentCollectionDate,
        "BillNumber": billNumber,
        "BillDate": billDate,
        "BillType": billType,
        "BillMode": billMode,
        "DeliveryStatus": deliveryStatus,
        "SalesmanId": salesmanId,
        "CategoryId": categoryId,
        "GrossAmount": grossAmount,
        "SchemeDiscount": schemeDiscount,
        "SalesReturn": salesReturn,
        "Replacement": replacement,
        "DistributorDiscount": distributorDiscount,
        "CashDiscount": cashDiscount,
        "WindowDisplay": windowDisplay,
        "TaxAmount": taxAmount,
        "DebitAdjustment": debitAdjustment,
        "CreditAdjustment": creditAdjustment,
        "NetAmount": netAmount,
        "AmountReceived": amountReceived,
        "OutstandingAmount": outstandingAmount,
        "IsHide": isHide,
        "UploadedDate": uploadedDate,
        "UploadedBy": uploadedBy,
        "Penalty": penalty,
        "LastPaymentDate": lastPaymentDate,
        "LastPaymentAmount": lastPaymentAmount,
      };
}
