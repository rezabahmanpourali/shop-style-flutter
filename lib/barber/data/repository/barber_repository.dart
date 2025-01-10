import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IBarberRepository {
  Future<ResponseModel> getBarber();
}

class BarberRepository extends IBarberRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getBarber() async {
    // Map<String, String> qParams = {'filter': 'barber_shop_id="$barberShopId"'};
    ResponseModel response = await dio
        .get('https://style-shop.liara.run/barber/');
    return response;
  }
}
