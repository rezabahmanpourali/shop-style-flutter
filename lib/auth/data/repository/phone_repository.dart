// import 'package:shop_style/common/models/api_service.dart';
// import 'package:shop_style/common/services/response_model.dart';
// import 'package:shop_style/locator.dart';

// abstract class IPhoneRepository {
//   Future<ResponseModel> sendPhoneNumber({required String phone});
// }

// class PhoneRepository extends IPhoneRepository {
//   ApiClientV3 dio = locator.get();

//   @override
//   Future<ResponseModel> sendPhoneNumber({required String phone}) async {
//     ResponseModel response = await dio
//         .post('https://style-shop.liara.run/auth/customers/create/', data: {
//       'phone': phone,
//       'name': '', // ارسال مقدار خالی برای name
//       'lastn': '', // ارسال مقدار خالی برای lastn
//       'password': '', // ارسال مقدار خالی برای password
//     });
//     return response;
//   }
// }
