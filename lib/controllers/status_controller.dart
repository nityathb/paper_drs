// import 'dart:convert';

// import 'package:paper_drs/Contants/api_constant.dart';
// import 'package:paper_drs/controllers/base_controller.dart';
// import 'package:paper_drs/helper/dialog_helper.dart';
// import 'package:paper_drs/service/app_exception.dart';
// import 'package:paper_drs/service/dio_client.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StatusLoanController extends GetxController with BaseController {
//   Future<dynamic> getData() async {
//     // showLoading('Fetching data');

//     var response =
//         await DioClient().get(baseUrl, getState).catchError(handleError);

//     print(response);
//     if (response == null) return;
//     // hideLoading();
//     return response;
//   }

//   void changeLoan(data,
//       {void Function(dynamic)? onSuccess, required String title}) async {
//     print("request $data");
//     showLoading(title);
//     var response = await DioClient().post(baseUrl, changeLoanstatus, data)
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message!);
//         DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });

//     if (response == null) return;
//     hideLoading();
//     print("responce $response");
//     onSuccess!(response);
//   }
// }

// class StatusInsuranceController extends GetxController with BaseController {
//   Future<dynamic> getData() async {
//     // showLoading('Fetching data');

//     var response =
//         await DioClient().get(baseUrl, getState).catchError(handleError);

//     print(response);
//     if (response == null) return;
//     // hideLoading();
//     return response;
//   }

//   void changeInsurance(data,
//       {void Function(dynamic)? onSuccess, required String title}) async {
//     print("request $data");
//     showLoading(title);
//     var response = await DioClient().post(baseUrl, changeInsurancestatus, data)
//         // .then((value) => {})
//         .catchError((error) {
//       print("error $error");

//       if (error is BadRequestException) {
//         var apiError = json.decode(error.message!);
//         DialogHelper.showErroDialog(description: apiError["reason"]);
//       } else {
//         handleError(error);
//       }
//     });

//     if (response == null) return;
//     hideLoading();
//     print("responce $response");
//     onSuccess!(response);
//   }
// }
