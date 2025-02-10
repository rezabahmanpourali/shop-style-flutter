// import 'dart:async';

// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shop_style/auth/data/repository/auth_repository.dart';
// import 'package:shop_style/common/configs/state_handeler.dart';
// import 'package:shop_style/common/services/response_model.dart';
// import 'package:shop_style/locator.dart';

// class AuthController extends ChangeNotifier {
//   IAuthRepository authRepository = locator.get();

//   ////////////////////////////////////////////////////////
//   BlocStatus phoneUserState = BlocStatusInitial();
//   BlocStatus otpState = BlocStatusInitial();
//   BlocStatus registerState = BlocStatusInitial();
//   BlocStatus facePropertyState = BlocStatusInitial();
//   BlocStatus phoneVerificationState =
//       BlocStatusInitial(); // وضعیت اولیه تایید شماره تلفن

//   ///////////////////////////////////////////////////////////
//   ResponseModel? phoneVerificationResponse;
//   ResponseModel? phoneUserResponse;
//   ResponseModel? otpResponse;
//   ResponseModel? registerResponse;
//   ResponseModel? facePropertyResponse;
//   String phoneSaved = '';
//   String nameSaved = '';
//   String lastNameSaved = '';
//   String passwordSaved = '';

//   //////////////////////////////////////////
//   int timeRemaining = 120; // مدت زمان تایمر (مثلاً 60 ثانیه)
//   bool canRequestOtpAgain = false;

//   late Timer _timer;

//   void startOtpTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (timeRemaining > 0) {
//         timeRemaining--; // کاهش زمان
//         notifyListeners(); // به‌روزرسانی وضعیت UI
//       } else {
//         canRequestOtpAgain = true; // اجازه دادن به کاربر برای درخواست مجدد OTP
//         notifyListeners(); // به‌روزرسانی وضعیت UI
//         _timer.cancel(); // توقف تایمر
//       }
//     });
//   }

//   void cancelOtpTimer() {
//     _timer.cancel(); // متوقف کردن تایمر
//   }

//   void requestOtpAgain() {
//     if (canRequestOtpAgain) {
//       timeRemaining = 120;
//       canRequestOtpAgain = false; // غیرفعال کردن دکمه "ارسال مجدد کد"

//       authRepository.sendPhoneNumber(phone: phoneSaved).then((response) {
//         if (response.statusCode == 200) {
//           startOtpTimer();
//           notifyListeners();
//         } else {
//           print('Error sending OTP');
//         }
//       });

//       notifyListeners();
//     }
//   }

//   //////////////////////////////////////////////////
//   //Request

//   // متد ارسال شماره تلفن
//   void sendPhoneNumber({required String phone}) async {
//     phoneSaved = phone;
//     notifyListeners();

//     phoneUserState = BlocStatusLoading();
//     notifyListeners();

//     phoneUserResponse = await authRepository.sendPhoneNumber(phone: phone);

//     if (phoneUserResponse?.statusCode == 200) {
//       phoneUserState = BlocStatusCompleted(phoneUserResponse);
//     } else {
//       phoneUserState = BlocStatusError(
//         phoneUserResponse?.error?.message,
//         phoneUserResponse?.statusCode,
//       );
//     }

//     notifyListeners();
//   }

//   void verifyPhoneNumber({required String phone, required String otp}) async {
//     phoneVerificationState = BlocStatusLoading();
//     notifyListeners();

//     try {
//       phoneVerificationResponse = await authRepository.veriFyPhoneNumber(
//         phone: phone,
//         otp: otp,
//       );


//       if (phoneVerificationResponse?.json != null) {
//         var message = phoneVerificationResponse?.json['message'];

//         if (phoneVerificationResponse?.statusCode == 200) {
//           if (message == 'User already logged in') {
//             phoneVerificationState =
//                 BlocStatusCompleted(phoneVerificationResponse);
//             notifyListeners();
//             return;
//           }

//           String token = phoneVerificationResponse?.json['token'];
//           await saveToken(token);

//           phoneVerificationState =
//               BlocStatusCompleted(phoneVerificationResponse);
//           notifyListeners();
//         } else {
//           phoneVerificationState = BlocStatusError(
//             'Error: ${phoneVerificationResponse?.json['error'] ?? 'Unknown error'}',
//             phoneVerificationResponse?.statusCode,
//           );
//           notifyListeners();
//         }
//       } else {
//         phoneVerificationState =
//             BlocStatusError('Response data is null or empty', 500);
//         notifyListeners();
//       }
//     } catch (e) {
//       phoneVerificationState = BlocStatusError('An error occurred: $e', 500);
//       notifyListeners();
//     }
//   }

//   //////////////////////////////////////////////////////////////////////////////////////
//   //Token Request

//   // متد برای ذخیره توکن
//   Future<void> saveToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//   }

//   // متد برای خواندن توکن
//   Future<String?> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }

//   //////////////////////////////////////////////////////////////////////////////////////

//   // متدی برای ذخیره نام و نام خانوادگی و پسورد
//   void setUserInfo({
//     required String name,
//     required String lastn,
//     required String password,
//   }) {
//     nameSaved = name;
//     lastNameSaved = lastn;
//     passwordSaved = password;

//     notifyListeners();
//   }

//   // متدی برای ذخیره شماره تلفن
//   void setPhone(String phoneNumber) {
//     phoneSaved = phoneNumber;
//     notifyListeners();
//   }

//   // //متد برای ثبت نام کاربر
//   void registerUser({
//   required String name,
//   required String lastn,
//   required String password,
//   required String faceForm,
//   required String hairForm,
//   required String ryeColor,
//   required String likeHair,
// }) async {
//   String phone = phoneSaved;
//   nameSaved = name;
//   lastNameSaved = lastn;
//   passwordSaved = password;
//   notifyListeners();

//   registerState = BlocStatusLoading();
//   notifyListeners();

//   try {
//     // دریافت توکن ذخیره‌شده
//     String? token = await getToken();

//     // اگر توکن وجود نداشته باشد، خطا را نشان می‌دهیم
//     if (token == null) {
//       registerState = BlocStatusError('Token not found', 500);
//       notifyListeners();
//       return;
//     }

//     // ارسال درخواست به سرور برای ثبت‌نام کاربر
//     registerResponse = await authRepository.getUserRegister(
//       name: name,
//       lastn: lastn,
//       password: password,
//       phone: phone,
//       userId: phoneUserResponse?.json['id'],
//       faceForm: faceForm,
//       hairForm: hairForm,
//       ryeColor: ryeColor,
//       likeHair: likeHair,
//       token: token,
//     );

//     if (registerResponse?.statusCode == 200) {
//       registerState = BlocStatusCompleted(registerResponse);
//     } else {
//       registerState = BlocStatusError(
//         registerResponse?.error?.message ?? 'Unknown error',
//         registerResponse?.statusCode,
//       );
//     }
//   } catch (e) {
//     registerState = BlocStatusError('An error occurred: $e', 500);
//   }

//   notifyListeners();
// }










//   //متدی برای ارسا اطلاعات صورت کاربر
//   void sendFaceProperty({
//     required String faceForm,
//     required String hairForm,
//     required String ryeColor,
//     required String likeHair,
//   }) async {
//     facePropertyState = BlocStatusLoading();
//     notifyListeners();

//     facePropertyResponse = await authRepository.sendFaceProperty(
//       phone: phoneSaved, //شماره ذخیره شده از صفحه اول
//       faceForm: faceForm,
//       hairForm: hairForm,
//       ryeColor: ryeColor,
//       likeHair: likeHair,
//       name: nameSaved, // نام ذخیره‌شده
//       lastn: lastNameSaved, // نام خانوادگی ذخیره‌شده
//       password: passwordSaved, // پسورد ذخیره‌شده
//       userId: phoneUserResponse?.json['id'],
//     );

//     if (facePropertyResponse?.statusCode == 200) {
//       facePropertyState = BlocStatusCompleted(facePropertyResponse);
//     } else {
//       facePropertyState = BlocStatusError(
//         facePropertyResponse?.error?.message,
//         facePropertyResponse?.statusCode,
//       );
//     }

//     notifyListeners();
//   }

//   // متد بازنشانی وضعیت شماره تلفن به حالت اولیه
//   void resetPhoneUserState() {
//     phoneUserState = BlocStatusInitial();
//     notifyListeners();
//   }
// }

//اصلی بالایی هست























import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_style/auth/data/repository/auth_repository.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

class AuthController extends ChangeNotifier {
  IAuthRepository authRepository = locator.get();

  // وضعیت‌ها
  BlocStatus phoneUserState = BlocStatusInitial();
  BlocStatus otpState = BlocStatusInitial();
  BlocStatus registerState = BlocStatusInitial();
  BlocStatus facePropertyState = BlocStatusInitial();
  BlocStatus phoneVerificationState = BlocStatusInitial();

  // پاسخ‌ها
  ResponseModel? phoneVerificationResponse;
  ResponseModel? phoneUserResponse;
  ResponseModel? otpResponse;
  ResponseModel? registerResponse;
  ResponseModel? facePropertyResponse;

  // متغیرهای ذخیره‌شده
  String phoneSaved = '';
  String nameSaved = '';
  String lastNameSaved = '';
  String passwordSaved = '';

  // متغیرهای تایمر
  int timeRemaining = 120;
  bool canRequestOtpAgain = false;
  late Timer _timer;

  // متد شروع تایمر OTP
  void startOtpTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeRemaining > 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        canRequestOtpAgain = true;
        notifyListeners();
        _timer.cancel();
      }
    });
  }

  void cancelOtpTimer() {
    _timer.cancel();
  }

  void requestOtpAgain() {
    if (canRequestOtpAgain) {
      timeRemaining = 120;
      canRequestOtpAgain = false;

      authRepository.sendPhoneNumber(phone: phoneSaved).then((response) {
        if (response.statusCode == 200) {
          startOtpTimer();
          notifyListeners();
        } else {
          print('Error sending OTP');
        }
      });
    }
  }

  // ارسال شماره تلفن
  void sendPhoneNumber({required String phone}) async {
    phoneSaved = phone;
    notifyListeners();

    phoneUserState = BlocStatusLoading();
    notifyListeners();

    phoneUserResponse = await authRepository.sendPhoneNumber(phone: phone);

    if (phoneUserResponse?.statusCode == 200) {
      phoneUserState = BlocStatusCompleted(phoneUserResponse);
    } else {
      phoneUserState = BlocStatusError(
        phoneUserResponse?.error?.message,
        phoneUserResponse?.statusCode,
      );
    }

    notifyListeners();
  }

  // تایید شماره تلفن
  void verifyPhoneNumber({required String phone, required String otp}) async {
    phoneVerificationState = BlocStatusLoading();
    notifyListeners();

    try {
      phoneVerificationResponse = await authRepository.veriFyPhoneNumber(
        phone: phone,
        otp: otp,
      );

      if (phoneVerificationResponse?.json != null) {
        var message = phoneVerificationResponse?.json['message'];

        if (phoneVerificationResponse?.statusCode == 200) {
          if (message == 'User already logged in') {
            phoneVerificationState = BlocStatusCompleted(phoneVerificationResponse);
            notifyListeners();
            return;
          }

          String token = phoneVerificationResponse?.json['token'];
          await saveToken(token);

          phoneVerificationState = BlocStatusCompleted(phoneVerificationResponse);
          notifyListeners();
        } else {
          phoneVerificationState = BlocStatusError(
            'Error: ${phoneVerificationResponse?.json['error'] ?? 'Unknown error'}',
            phoneVerificationResponse?.statusCode,
          );
          notifyListeners();
        }
      } else {
        phoneVerificationState = BlocStatusError('Response data is null or empty', 500);
        notifyListeners();
      }
    } catch (e) {
      phoneVerificationState = BlocStatusError('An error occurred: $e', 500);
      notifyListeners();
    }
  }

  // ذخیره توکن
  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // خواندن توکن
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // بررسی انقضای توکن
  Future<bool> isTokenExpired(String token) async {
    // برای مثال اگر از JWT استفاده می‌کنید می‌توانید توکن را decode کنید و تاریخ انقضای آن را بررسی کنید
    return false; // فرض بر این است که توکن منقضی نشده
  }

  // رفرش کردن توکن
  Future<String?> refreshToken(String token) async {
    try {
      ResponseModel response = await authRepository.refreshToken(token: token);
      if (response.statusCode == 200) {
        String newToken = response.json['token'];
        await saveToken(newToken);
        return newToken;
      }
    } catch (e) {
      print("Error refreshing token: $e");
    }
    return null;
  }

  // ثبت‌نام کاربر
  void registerUser({
    required String name,
    required String lastn,
    required String password,
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
  }) async {
    String phone = phoneSaved;
    nameSaved = name;
    lastNameSaved = lastn;
    passwordSaved = password;
    notifyListeners();

    registerState = BlocStatusLoading();
    notifyListeners();

    try {
      // دریافت توکن ذخیره‌شده
      String? token = await getToken();

      // اگر توکن وجود نداشته باشد، خطا را نشان می‌دهیم
      if (token == null) {
        registerState = BlocStatusError('Token not found', 500);
        notifyListeners();
        return;
      }

      // بررسی اینکه آیا توکن منقضی شده است
      bool tokenExpired = await isTokenExpired(token);

      if (tokenExpired) {
        // رفرش توکن اگر منقضی شده باشد
        token = await refreshToken(token);
      }

      // ارسال درخواست به سرور برای ثبت‌نام کاربر
      registerResponse = await authRepository.getUserRegister(
        name: name,
        lastn: lastn,
        password: password,
        phone: phone,
        userId: phoneUserResponse?.json['id'],
        faceForm: faceForm,
        hairForm: hairForm,
        ryeColor: ryeColor,
        likeHair: likeHair,
        token: token!, // ارسال توکن به‌روزرسانی شده
      );

      if (registerResponse?.statusCode == 200) {
        registerState = BlocStatusCompleted(registerResponse);
      } else {
        registerState = BlocStatusError(
          registerResponse?.error?.message ?? 'Unknown error',
          registerResponse?.statusCode,
        );
      }
    } catch (e) {
      registerState = BlocStatusError('An error occurred: $e', 500);
    }

    notifyListeners();
  }

  // ارسال ویژگی‌های صورت کاربر
  void sendFaceProperty({
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
  }) async {
    facePropertyState = BlocStatusLoading();
    notifyListeners();

    facePropertyResponse = await authRepository.sendFaceProperty(
      phone: phoneSaved,
      faceForm: faceForm,
      hairForm: hairForm,
      ryeColor: ryeColor,
      likeHair: likeHair,
      name: nameSaved,
      lastn: lastNameSaved,
      password: passwordSaved,
      userId: phoneUserResponse?.json['id'],
    );

    if (facePropertyResponse?.statusCode == 200) {
      facePropertyState = BlocStatusCompleted(facePropertyResponse);
    } else {
      facePropertyState = BlocStatusError(
        facePropertyResponse?.error?.message,
        facePropertyResponse?.statusCode,
      );
    }

    notifyListeners();
  }

  // متد بازنشانی وضعیت شماره تلفن به حالت اولیه
  void resetPhoneUserState() {
    phoneUserState = BlocStatusInitial();
    notifyListeners();
  }
}

