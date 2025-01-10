import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class ICommentRepository {
  Future<ResponseModel> getComments(int barberShopId);
}

class CommentRepository extends ICommentRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getComments(int barberShopId) async {
    ResponseModel response = await dio.get(
        'https://style-shop.liara.run/barber_shop/barbershops/1/comments/',queryParameters: {
          "barber_shop_id ":barberShopId, 
        });
    return response;
  }
}
