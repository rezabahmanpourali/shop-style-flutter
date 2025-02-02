// import 'package:shop_style/common/models/api_service.dart';
// import 'package:shop_style/common/services/response_model.dart';
// import 'package:shop_style/locator.dart';

// abstract class IRegisterRepository {
//   Future<ResponseModel> getUserRegister(
//       {required String name, required String lastn, required String password, required String phone,
//     required int? userId
//       });
// }

// class RegisterRepository extends IRegisterRepository {
//   final ApiClientV3 dio = locator.get();

//   @override
//   Future<ResponseModel> getUserRegister({
//     required String name,
//     required String lastn,
//     required String password,
//     required String phone, // اضافه کردن فیلد تلفن
//     required int? userId
//   }) async {
//     ResponseModel response = await dio
//         .put('https://style-shop.liara.run/auth/customers/edit/$userId/', data: {
//       'name': name,
//       'lastn': lastn,
//       'password': password,
//       'phone': phone, // ارسال شماره تلفن
//     });
//     return response;
//   }
// }
