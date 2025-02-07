import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IAuthRepository {
  Future<ResponseModel> getUserRegister(
      {required String name,
      required String lastn,
      required String password,
      required String phone,
      required int? userId});

  Future<ResponseModel> getOtpCode({required String phone});

  Future<ResponseModel> sendPhoneNumber({required String phone});

  Future<ResponseModel> sendFaceProperty(
      {required String phone,
      required String faceForm,
      required String hairForm,
      required String ryeColor,
      required String likeHair,
      required String name,
      required String lastn,
      required String password,
      required int? userId});
}

class AuthRepository extends IAuthRepository {
  final ApiClientV3 dio = locator.get();

  //سومی

  @override
  Future<ResponseModel> getUserRegister({
    required String name,
    required String lastn,
    required String password,
    required String phone,
    required int? userId,
  }) async {
    ResponseModel response = await dio.put(
      'https://style-shop.liara.run/auth/customers/edit/$userId/',
      data: {
        'name': name,
        'lastn': lastn,
        'password': password,
        'phone': phone,
      },
    );
    return response;
  }

  //دومی

  @override
  Future<ResponseModel> getOtpCode({required String phone}) async {
    ResponseModel response = await dio.get(
      'https://style-shop.liara.run/auth/customers/otp/',
      queryParameters: {'phone': phone},
    );
    return response;
  }

  //اولین

  @override
  Future<ResponseModel> sendPhoneNumber({required String phone}) async {
    ResponseModel response = await dio.post(
      'https://style-shop.liara.run/auth/customers/otp/',
      data: {
        'phone': phone,
        'name': '', // ارسال مقدار خالی برای name
        'lastn': '', // ارسال مقدار خالی برای lastn
        'password': '', // ارسال مقدار خالی برای password
      },
    );
    return response;
  }

  @override
  Future<ResponseModel> sendFaceProperty({
    required String phone,
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
    required String name,
    required String lastn,
    required String password,
    required int? userId,
  }) async {
    ResponseModel response = await dio.put(
      'https://style-shop.liara.run/auth/customers/edit/$userId/',
      data: {
        'phone': phone,
        'face_form': faceForm,
        'hair_form': hairForm,
        'ryecolor': ryeColor,
        'like_hair': likeHair,
        'name': name,
        'lastn': lastn,
        'password': password,
      },
    );
    return response;
  }
}
