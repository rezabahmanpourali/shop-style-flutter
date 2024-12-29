import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_style/auth/data/repository/auth_repository.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/barber/data/repository/barber_repository.dart';
import 'package:shop_style/barber/data/repository/barber_shop_repository.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/enums/enums.dart';
import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register Dio instance
  locator.registerSingleton<Dio>(Dio());

  locator.registerSingleton<ApiClientV3>(
    ApiClientV3(),
  );

  locator.registerSingleton<ApiClientV3>(
    ApiClientV3(
      headerType: AppHttpHeadersEnum.File,
      receiveTimeout: const Duration(
        seconds: 20,
      ),
    ),
    instanceName: "ApiClientV3File",
  );

  locator.registerSingleton<ApiClientV3>(
      ApiClientV3(
        headerType: AppHttpHeadersEnum.Otp,
      ),
      instanceName: "ApiClientV3Otp");

  //repository
  locator.registerSingleton<IAuthenticateRepository>(AuthenticateRepository());
  locator.registerSingleton<IBarberShopRepository>(BarberShopRepository());
  locator.registerSingleton<IBarberRepository>(BarberRepository());

  //controllers
  locator.registerSingleton<AuthController>(AuthController());
  locator.registerSingleton<GlobalController>(GlobalController());
  locator.registerSingleton<BarberShopController>(BarberShopController());
  locator.registerSingleton<BarberController>(BarberController());

}
