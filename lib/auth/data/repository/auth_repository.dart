import 'package:dio/dio.dart';
import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/locator.dart';

abstract class IAuthRepository {
  Future<ResponseModel> getUserRegister({
    required String name,
    required String lastn,
    required String password,
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
    required String token,
  });

  Future<ResponseModel> sendPhoneNumber({required String phone});

  Future<ResponseModel> veriFyPhoneNumber(
      {required String phone, required String otp});

  Future<ResponseModel> sendFaceProperty({
    required String phone,
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
    required String name,
    required String lastn,
    required String password,
  });

  // متد رفرش توکن
  Future<ResponseModel> refreshToken({required String token});

  // متد ذخیره‌سازی توکن
  Future<void> saveToken(String token);

  // متد دریافت توکن
  Future<String?> getToken();
}

class AuthRepository extends IAuthRepository {
  final ApiClientV3 dio = locator.get();
  final GlobalController _globalController = locator.get();

  // متد ذخیره‌سازی توکن
  @override
  Future<void> saveToken(String token) async {
    await _globalController.setToken(token);
  }

  // متد دریافت توکن
  @override
  Future<String?> getToken() async {
    return _globalController.getToken();
  }

  @override
  Future<ResponseModel> refreshToken({required String token}) async {
    try {
      String url =
          'https://style-shop.liara.run/auth/customers/refresh/?token=$token';
      print('Refreshing token with URL: $url');

      Options options = Options(
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      );

      ResponseModel response = await dio.post(
        url,
        options: options,
      );

      if (response.statusCode == 200) {
        print('Response data: ${response.json}');

        String newToken = response.json['token'];

        await saveToken(newToken);

        return response;
      } else {
        print('Error response: ${response.json}');
        throw Exception('Failed to refresh token');
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw Exception('An error occurred while refreshing the token');
    }
  }





Future<ResponseModel> makeRequestWithToken({
  required String url,
  required Map<String, dynamic> data,
  required String method,
  required Map<String, String> headers,
}) async {
  String? token = await getToken();

  if (token == null) {
    throw Exception('No token available');
  }

  print('Initial token from storage: $token'); 

  print('Headers: ${headers}');

  Options options = Options(
    headers: {
      'authorization': token, 
      'accept': 'application/json',
      'Content-Type': 'application/json',
    },
  );

  ResponseModel response;

  try {
    if (method == 'POST') {
      response = await dio.post(url, data: data, options: options);
    } else {
      response = await dio.put(url, data: data, options: options);
    }

    if (response.statusCode == 401) {
      print("Token expired, attempting to refresh...");

      // رفرش کردن توکن
      ResponseModel newTokenResponse = await refreshToken(token: token);

      if (newTokenResponse.statusCode == 200) {
        String newToken = newTokenResponse.json['token'];

        // ذخیره توکن جدید
        await saveToken(newToken);

        // بررسی توکن ذخیره شده و چاپ آن
        String? tokenFromStorage = await getToken();
        print("New token from storage after refresh: $tokenFromStorage");

        options = Options(
          headers: {
            'authorization': newToken, 
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        );

        print("Authorization header after refresh: ${options.headers?['authorization']}");

        // دوباره ارسال درخواست با توکن جدید
        if (method == 'POST') {
          response = await dio.post(url, data: data, options: options);
        } else {
          response = await dio.put(url, data: data, options: options);
        }
      } else {
        throw Exception('Failed to refresh token');
      }
    }

  } catch (e) {
    print("Error during request: $e");
    throw e;
  }

  return response;
}



  @override
  Future<ResponseModel> getUserRegister({
    required String name,
    required String lastn,
    required String password,
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
    required String token, // توکن در پارامترهاست، نیازی به گرفتن مجدد نیست
  }) async {
    ResponseModel response = await makeRequestWithToken(
      url: 'https://style-shop.liara.run/auth/customers/edit/',
      data: {
        'name': name,
        'lastn': lastn,
        'face_form': faceForm,
        'hair_form': hairForm,
        'ryecolor': ryeColor,
        'like_hair': likeHair,
        'password': password,
      },
      method: 'PUT',
      headers: {
        'authorization': 'Bearer $token'
      },
    );
    print('responsesssssssssss:$response');
    response.data = response.json;
    return response;
  }

  // متد ارسال شماره موبایل به OTP
  @override
  Future<ResponseModel> sendPhoneNumber({required String phone}) async {
    Options options = Options(
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    ResponseModel response = await dio.post(
      'https://style-shop.liara.run/auth/customers/otp/?phone=$phone',
      options: options,
    );

    return response;
  }

  // متد برای verify کردن
  @override
  Future<ResponseModel> veriFyPhoneNumber(
      {required String phone, required String otp}) async {
    Options options = Options(
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    ResponseModel response = await dio.post(
      'https://style-shop.liara.run/auth/customers/verify/?phone=$phone&otp=$otp',
      options: options,
    );

    if (response.statusCode == 200) {
      String token = response.json['token'];
      await saveToken(token); // ذخیره توکن جدید
    }

    return response;
  }

  // متد ارسال ویژگی‌های چهره
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
  }) async {
    ResponseModel response = await dio.put(
      '',
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
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    return response;
  }
}
