// import 'dart:convert';

// import 'package:paper_drs/Contants/api_constant.dart';
// import 'package:paper_drs/Model/MyJewelleryModel.dart';
// import 'package:paper_drs/controllers/base_controller.dart';
// import 'package:paper_drs/helper/dialog_helper.dart';
// import 'package:paper_drs/service/app_exception.dart';
// import 'package:paper_drs/service/dio_client.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ItemController extends GetxController with BaseController {
//   void getItemMethod({void Function(dynamic) onSuccess}) async {
//     print("request");
//     // showLoading('Posting data...');
//     var response = await DioClient().post(baseUrl, getItem, {})
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message);
//         // DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });

//     if (response == null) return;
//     // hideLoading();
//     print(response);
//     onSuccess(response);
//   }

//   void insertJewellery(JewelleryModel jewelleryModel,
//       {void Function(dynamic) onSuccess}) async {
//     print("request 1");
//     showLoading('updating details data...');
//     var response = await DioClient()
//         .post(baseUrl, jewelleryInsertapi, jewelleryModel.toJson())
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message);
//         DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });

//     if (response == null) return;
//     hideLoading();
//     print(response);
//     onSuccess(response);
//   }
// }

// class PurityController extends GetxController with BaseController {
//   void getPurityMethod({void Function(dynamic) onSuccess}) async {
//     print("request");
//     // showLoading('Posting data...');
//     var response = await DioClient().post(baseUrl, getPurity, {})
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message);
//         // DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });

//     if (response == null) return;
//     // hideLoading();
//     print(response);
//     onSuccess(response);
//   }
// }

// class BankController extends GetxController with BaseController {
//   void getbankMethod({void Function(dynamic) onSuccess}) async {
//     print("request");
//     // showLoading('Posting data...');
//     var response = await DioClient().post(baseUrl, getbank, {})
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message);
//         // DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });

//     if (response == null) return;
//     // hideLoading();
//     print(response);
//     onSuccess(response);
//   }
// }
