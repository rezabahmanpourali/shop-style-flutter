import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IHomeRepository {
  Future<ResponseModel> getHairModel({String? sortbye});
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
}
