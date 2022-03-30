// ignore_for_file: file_names
// import 'dart:convert';
// import 'package:paper_drs/models/InsuranceDetailModel.dart';
// import 'package:get/get.dart';

// import 'package:paper_drs/Contants/api_constant.dart';
// import 'package:paper_drs/helper/dialog_helper.dart';
// import 'package:paper_drs/service/app_exception.dart';
// import 'package:paper_drs/service/dio_client.dart';

// import 'base_controller.dart';

// class InsuranceController extends GetxController with BaseController {
//   void getData() async {
//     showLoading('Fetching data');
//     var response = await DioClient()
//         .get('https://jsonplaceholder.typicode.com', '/todos/1')
//         .catchError(handleError);
//     if (response == null) return;
//     hideLoading();
//     print(response);
//   }

//   void updateInsurance(InsuranceDetaildata insuranceModel,
//       {void Function(dynamic)? onSuccess}) async {
//     print("request 1");
//     print(insuranceModel.toJson());
//     showLoading('updating details data...');
//     var response = await DioClient()
//         .post(baseUrl, updateInsuranceapi, insuranceModel.toJson())
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
//     print(response);
//     onSuccess!(response);
//   }
// }
