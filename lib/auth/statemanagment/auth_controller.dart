import 'package:flutter/foundation.dart';
import 'package:shop_style/auth/data/repository/auth_repository.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/locator.dart';

class AuthController extends ChangeNotifier {
  IAuthenticateRepository authenticateRepository = locator.get();
  BlocStatus registerUserState = BlocStatusInitial();

  ResponseModel? registerUserResponse;
  void registerUser(
      {required String userName, required String password}) async {
    registerUserState = BlocStatusLoading();
    notifyListeners();
    registerUserResponse = await authenticateRepository.registerUser(
      userName: userName,
      password: password,
    );
    if (registerUserResponse?.statusCode == 200) {
      registerUserState = BlocStatusCompleted(null);
      locator
          .get<GlobalController>()
          .setToken(registerUserResponse?.json['access_token']);
    } else {
      registerUserState = BlocStatusError(
        registerUserResponse?.error?.message,
        registerUserResponse?.statusCode,
      );
    }
    notifyListeners();
  }
}
