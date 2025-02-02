import 'package:flutter/foundation.dart';
import 'package:shop_style/auth/data/repository/auth_repository.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

class AuthController extends ChangeNotifier {
  IAuthRepository authRepository = locator.get();

  ////////////////////////////////////////////////////////
  BlocStatus phoneUserState = BlocStatusInitial();
  BlocStatus otpState = BlocStatusInitial();
  BlocStatus registerState = BlocStatusInitial();
  BlocStatus facePropertyState = BlocStatusInitial();
  ///////////////////////////////////////////////////////////

  ResponseModel? phoneUserResponse;
  ResponseModel? otpResponse;
  ResponseModel? registerResponse;
  ResponseModel? facePropertyResponse;
  String phoneSaved = '';
  String nameSaved = '';
  String lastNameSaved = '';
  String passwordSaved = '';

  // متد ارسال شماره تلفن
  void sendPhoneNumber({required String phone}) async {
    phoneSaved = phone;
    notifyListeners();
    phoneUserState = BlocStatusLoading();
    notifyListeners();

    phoneUserResponse = await authRepository.sendPhoneNumber(
      phone: phone,
    );

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

  // متد ارسال OTP
  void sendOtp({required String phone}) async {
    otpState = BlocStatusLoading();
    notifyListeners();

    otpResponse = await authRepository.getOtpCode(
      phone: phone,
    );

    if (otpResponse?.statusCode == 200) {
      otpState = BlocStatusCompleted(otpResponse);
    } else {
      otpState = BlocStatusError(
        otpResponse?.error?.message,
        otpResponse?.statusCode,
      );
    }

    notifyListeners();
  }

  // متدی برای ذخیره نام و نام خانوادگی و پسورد
  void setUserInfo({
    required String name,
    required String lastn,
    required String password,
  }) {
    nameSaved = name;
    lastNameSaved = lastn;
    passwordSaved = password;
    
    notifyListeners();
  }

  // متدی برای ذخیره شماره تلفن
  void setPhone(String phoneNumber) {
    phoneSaved = phoneNumber;
    notifyListeners();
  }

  //متد برای ثبت نام کاربر
  void registerUser({
    required String name,
    required String lastn,
    required String password,
  }) async {
    String phone = phoneSaved;
     nameSaved = name;
     lastNameSaved = lastn;
     passwordSaved = password;
    notifyListeners();
    registerState = BlocStatusLoading();
    notifyListeners();

    registerResponse = await authRepository.getUserRegister(
        name: name,
        lastn: lastn,
        password: password,
        phone: phone,
        userId: phoneUserResponse?.json['id']);

    if (registerResponse?.statusCode == 200) {
      registerState = BlocStatusCompleted(registerResponse);
    } else {
      registerState = BlocStatusError(
        registerResponse?.error?.message,
        registerResponse?.statusCode,
      );
    }

    notifyListeners();
  }

  //متدی برای ارسا اطلاعات صورت کاربر
  void sendFaceProperty({
    required String faceForm,
    required String hairForm,
    required String ryeColor,
    required String likeHair,
  }) async {
    facePropertyState = BlocStatusLoading();
    notifyListeners();

    facePropertyResponse = await authRepository.sendFaceProperty(
      phone: phoneSaved, //شماره ذخیره شده از صفحه اول
      faceForm: faceForm,
      hairForm: hairForm,
      ryeColor: ryeColor,
      likeHair: likeHair,
      name: nameSaved, // نام ذخیره‌شده
      lastn: lastNameSaved, // نام خانوادگی ذخیره‌شده
      password: passwordSaved, // پسورد ذخیره‌شده
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
