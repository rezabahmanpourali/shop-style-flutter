// import 'package:dio/dio.dart';
// import 'package:shop_style/common/models/api_service.dart';
// import 'package:shop_style/common/services/response_model.dart';
// import 'package:shop_style/locator.dart';

// abstract class IAuthRepository {
//   Future<ResponseModel> getUserRegister({
//     required String name,
//     required String lastn,
//     required String password,
//     required String phone,
//     required String faceForm,
//     required String hairForm,
//     required String ryeColor,
//     required String likeHair,
//     required String token,
//     required int userId,
//   });

//   Future<ResponseModel> sendPhoneNumber({required String phone});

//   Future<ResponseModel> veriFyPhoneNumber(
//       {required String phone, required String otp});

//   Future<ResponseModel> sendFaceProperty(
//       {required String phone,
//       required String faceForm,
//       required String hairForm,
//       required String ryeColor,
//       required String likeHair,
//       required String name,
//       required String lastn,
//       required String password,
//       required int? userId});
// }

// class AuthRepository extends IAuthRepository {
//   final ApiClientV3 dio = locator.get();

//   //ریپازیتوری احراز هویت
//   @override
//   Future<ResponseModel> getUserRegister({
//     required String name,
//     required String lastn,
//     required String password,
//     required String phone,
//     required String faceForm,
//     required String hairForm,
//     required String ryeColor,
//     required String likeHair,
//     required String token,
//     required int userId,
//   }) async {
//     ResponseModel response = await dio.put(
//       'https://style-shop.liara.run/auth/customers/edit/$token/$userId/', // جایگذاری {token} و userId

//       data: {
//         'name': name,
//         'lastn': lastn,
//         'phone': phone,
//         'face_form': faceForm,
//         'hair_form': hairForm,
//         'ryecolor': ryeColor,
//         'like_hair': likeHair,
//         'password': password,
//       },
//       options: Options(
//         headers: {
//           'accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );

//     print('Response: ${response.data}');
//     return response;
//   }

//   //متد ارسال شماره موبایل به otp
//   @override
//   Future<ResponseModel> sendPhoneNumber({required String phone}) async {
//     ResponseModel response = await dio.post(
//       'https://style-shop.liara.run/auth/customers/otp/?phone=$phone',
//       options: Options(
//         headers: {
//           'accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );

//     return response;
//   }

//   //متد برای verify کردن
//   @override
//   Future<ResponseModel> veriFyPhoneNumber(
//       {required String phone, required String otp}) async {
//     ResponseModel response = await dio.post(
//       'https://style-shop.liara.run/auth/customers/verify/?phone=$phone&otp=$otp',
//       options: Options(
//         headers: {
//           'accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );

//     return response;
//   }

//   @override
//   Future<ResponseModel> sendFaceProperty({
//     required String phone,
//     required String faceForm,
//     required String hairForm,
//     required String ryeColor,
//     required String likeHair,
//     required String name,
//     required String lastn,
//     required String password,
//     required int? userId,
//   }) async {
//     ResponseModel response = await dio.put(
//       'https://style-shop.liara.run/auth/customers/edit/$userId/',
//       data: {
//         'phone': phone,
//         'face_form': faceForm,
//         'hair_form': hairForm,
//         'ryecolor': ryeColor,
//         'like_hair': likeHair,
//         'name': name,
//         'lastn': lastn,
//         'password': password,
//       },
//       options: Options(
//         headers: {
//           'accept': 'application/json',
//           'Content-Type': 'application/json',
//         },
//       ),
//     );
//     return response;
//   }
// }

//کد اصلی فعلا بالایی هست

import 'package:dio/dio.dart';
import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';
import 'package:shared_preferences/shared_preferences.dart'; // برای ذخیره‌سازی توکن

abstract class IAuthRepository {
  Future<ResponseModel> getUserRegister({
    required String name,
    required String lastn,
    required String password,
    required String phone,
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
    required String token,
    required int userId,
  });

  Future<ResponseModel> sendPhoneNumber({required String phone});

  Future<ResponseModel> veriFyPhoneNumber(
      {required String phone, required String otp});

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

  // متد رفرش توکن
  Future<ResponseModel> refreshToken({required String token});

  // متد ذخیره‌سازی توکن
  Future<void> saveToken(String token);

  // متد دریافت توکن
  Future<String?> getToken();
}

class AuthRepository extends IAuthRepository {
  final ApiClientV3 dio = locator.get();
  final SharedPreferences _prefs = locator.get();

  // متد ذخیره‌سازی توکن
  @override
  Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  // متد دریافت توکن
  @override
  Future<String?> getToken() async {
    return _prefs.getString('token');
  }

  // متد رفرش توکن
  @override
  Future<ResponseModel> refreshToken({required String token}) async {
    ResponseModel response = await dio.get(
      'https://style-shop.liara.run/auth/customers/refresh/?token=$token',
    );

    if (response.statusCode == 200) {
      String newToken = response.json['token'];
      await saveToken(newToken);
      return response;
    } else {
      throw Exception('Failed to refresh token');
    }
  }

  // متد برای ارسال درخواست با توکن
  Future<ResponseModel> makeRequestWithToken({
    required String url,
    required Map<String, dynamic> data,
    required String method,
  }) async {
    String? token = await getToken();

    if (token == null) {
      throw Exception('No token available');
    }

    Options options = Options(
      headers: {
        'Authorization': 'Bearer $token',
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    ResponseModel response;

    if (method == 'POST') {
      response = await dio.post(url, data: data, options: options);
    } else {
      response = await dio.put(url, data: data, options: options);
    }

    // بررسی اینکه توکن منقضی شده است یا نه
    if (response.statusCode == 401) {
      // اگر ارور 401 (Unauthorized) آمد، یعنی توکن منقضی شده است
      await refreshToken(token: token); // رفرش توکن رو انجام بده
      return await makeRequestWithToken(
          url: url, data: data, method: method); // دوباره درخواست رو ارسال کن
    }

    return response;
  }

  // متد ثبت‌نام
@override
Future<ResponseModel> getUserRegister({
  required String name,
  required String lastn,
  required String password,
  required String phone,
  required String faceForm,
  required String hairForm,
  required String ryeColor,
  required String likeHair,
  required String token,
  required int userId,
}) async {
  print(userId);
  ResponseModel response = await makeRequestWithToken(
    url: 'https://style-shop.liara.run/auth/customers/edit/?a_token=$token&customer_id=$userId',
    data: {
      'name': name,
      'lastn': lastn,
      'phone': phone,
      'face_form': faceForm,
      'hair_form': hairForm,
      'ryecolor': ryeColor,
      'like_hair': likeHair,
      'password': password,
    },
    method: 'PUT',
  );

  print('Response: ${response.json}');
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
      await saveToken(token);
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
