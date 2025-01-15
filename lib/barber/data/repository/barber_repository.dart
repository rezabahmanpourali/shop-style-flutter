import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IBarberRepository {
  Future<ResponseModel> getBarber(int? barberShopId);
}

class BarberRepository extends IBarberRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getBarber(int? barberShopId) async {
    ResponseModel response = await dio.get(
      'https://style-shop.liara.run/barber/barbershop/${barberShopId}/barbers',
    );
    return response;
  }
}
