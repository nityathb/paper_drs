// import 'dart:convert';

// import 'package:paper_drs/Contants/api_constant.dart';
// import 'package:paper_drs/controllers/base_controller.dart';
// import 'package:paper_drs/helper/dialog_helper.dart';
// import 'package:paper_drs/models/LoanDetailmodel.dart';
// import 'package:paper_drs/service/app_exception.dart';
// import 'package:paper_drs/service/dio_client.dart';
// import 'package:get/get.dart';

// class LoanController extends GetxController with BaseController {
//   void getData() async {
//     showLoading('Fetching data');
//     var response = await DioClient()
//         .get('https://jsonplaceholder.typicode.com', '/todos/1')
//         .catchError(handleError);
//     if (response == null) return;
//     hideLoading();
//     print(response);
//   }

//   void updateLoan(Data loanModel, {void Function(dynamic)? onSuccess}) async {
//     print("request 1");
//     showLoading('updating details data...');
//     var response =
//         await DioClient().post(baseUrl, updateLoanapi, loanModel.toJson())
//             // .then((value) => {})
//             .catchError((error) {
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
