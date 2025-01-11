import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IBarberShopRepository {
  Future<ResponseModel> getBarberShops({String? shopType});
}

class BarberShopRepository extends IBarberShopRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getBarberShops({String? shopType}) async {
    ResponseModel response = await dio.get(
        'https://style-shop.liara.run/barber_shop/barbershops/',
        queryParameters: {'shop_type': shopType});
    return response;
  }
}
