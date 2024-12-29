import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IBarberShopRepository {
  Future<ResponseModel> getBarberShops();
}

class BarberShopRepository extends IBarberShopRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getBarberShops() async {
    try {
      ResponseModel response = await dio.get('https://style-shop.liara.run/barber_shop/barbershops/');
      return response;
    } catch (e) {
      throw Exception('ارور در ارسال بابر شاپ: $e');
    }
  }
}
