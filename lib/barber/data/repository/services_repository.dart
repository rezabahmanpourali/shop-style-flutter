import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IServicesRepository {
  Future<ResponseModel> getServices(int? barberShopId);
}

class ServicesRepository extends IServicesRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getServices(int? barberShopId) async {
    ResponseModel response = await dio.get(
      'https://style-shop.liara.run/barber_shop/barbershops/${barberShopId}/hair_models/',
    );
    return response;
  }
}
