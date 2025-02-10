import 'package:dio/dio.dart';
import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IHomeRepository {
  Future<ResponseModel> getHairModel({String? sortbye});
  Future<ResponseModel> sendLatLong({
    required String longitude,
    required String latitude,
    required int id,
    required int customerId,
  });
}

class HomeRepository extends IHomeRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getHairModel({String? sortbye}) async {
    ResponseModel response = await dio.get(
        'https://style-shop.liara.run/hair_model/barber-hair-models/hair_models',
        queryParameters: {'sortby': sortbye});
    return response;
  }
@override
Future<ResponseModel> sendLatLong({
  required String longitude,
  required String latitude,
  required int id,
  required int customerId,
}) async {
  // ایجاد پارامتر options به صورت پیش‌فرض
  Options options = Options(
    headers: {
      // در صورت نیاز، هدرها را اضافه کنید
      // 'Authorization': 'Bearer YOUR_TOKEN',
    },
  );

  ResponseModel response = await dio.post(
    'https://style-shop.liara.run/auth/customers/${customerId}/addresses/',
    data: {
      "longitude": longitude,
      "latitude": latitude,
      "id": id,
      "customer_id": customerId,
    },
    options: options, // اضافه کردن options به متد
  );

  return response;
}

}
