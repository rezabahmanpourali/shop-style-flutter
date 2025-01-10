import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class ICategoryRepository {
  Future<ResponseModel> getCategoryModel();
}

class CategoryRepository extends ICategoryRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getCategoryModel() async {
    ResponseModel response =
        await dio.get('https://style-shop.liara.run/category/categories');
    return response;
  }
}
