import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IAuthenticateRepository {
  Future<ResponseModel> registerUser(
      {required String userName, required String password});

  Future<ResponseModel> loginUser(
      {required String userName, required String password});
}

class AuthenticateRepository extends IAuthenticateRepository {
  ApiClientV3 dio = locator.get();
  @override
  Future<ResponseModel> registerUser(
      {required String userName, required String password}) async {
    ResponseModel response = await dio.post('auth/register', data: {
      "username": userName,
      "password": password,
    });
    return response;
  }

  @override
  Future<ResponseModel> loginUser(
      {required String userName, required String password}) async {
    ResponseModel response = await dio.post('auth/login', data: {
      'username': userName,
      'password': password,
    });
    return response;
  }
  
}
