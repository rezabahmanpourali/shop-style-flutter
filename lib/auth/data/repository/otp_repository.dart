// import 'package:shop_style/common/models/api_service.dart';
// import 'package:shop_style/common/services/response_model.dart';
// import 'package:shop_style/locator.dart';

// abstract class IOtpRepository {
//   Future<ResponseModel> getOtpCode({required String phone});
// }

// class OtpRepository extends IOtpRepository {
//   ApiClientV3 dio = locator.get();

//   @override
//   Future<ResponseModel> getOtpCode({required String phone}) async {
//     ResponseModel response = await dio.get(
//       'https://style-shop.liara.run/auth/customers/otp/',
//       queryParameters: {'phone': phone},
//     );
//     return response;
//   }
// }
