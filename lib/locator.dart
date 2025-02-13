// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shop_style/auth/data/repository/auth_repository.dart';
// import 'package:shop_style/auth/data/repository/otp_repository.dart';
// import 'package:shop_style/auth/data/repository/phone_repository.dart';
// import 'package:shop_style/auth/data/repository/register_user_repository.dart';
// import 'package:shop_style/auth/statemanagment/auth_controller.dart';
// import 'package:shop_style/barber/data/repository/barber_repository.dart';
// import 'package:shop_style/barber/data/repository/barber_shop_repository.dart';
// import 'package:shop_style/barber/data/repository/comment_repository.dart';
// import 'package:shop_style/barber/data/repository/services_repository.dart';
// import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
// import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
// import 'package:shop_style/common/configs/enums.dart';
// import 'package:shop_style/common/models/api_service.dart';
// import 'package:shop_style/common/statemanagment/global_controller.dart';
// import 'package:shop_style/home/data/repository/category_repository.dart';
// import 'package:shop_style/home/data/repository/home_repository.dart';
// import 'package:shop_style/home/statemanagment/home_controller.dart';

// final locator = GetIt.instance;

// Future<void> setupLocator() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   locator.registerSingleton<SharedPreferences>(prefs);
//   locator.registerSingleton<GlobalController>(GlobalController());
//   // Register Dio instance
//   locator.registerSingleton<Dio>(Dio());

//   locator.registerSingleton<ApiClientV3>(
//     ApiClientV3(),
//   );

//   locator.registerSingleton<ApiClientV3>(
//     ApiClientV3(
//       headerType: AppHttpHeadersEnum.File,
//       receiveTimeout: const Duration(
//         seconds: 20,
//       ),
//     ),
//     instanceName: "ApiClientV3File",
//   );

//   locator.registerSingleton<ApiClientV3>(
//       ApiClientV3(
//         headerType: AppHttpHeadersEnum.Otp,
//       ),
//       instanceName: "ApiClientV3Otp");

//   //repository
//   locator.registerSingleton<IAuthRepository>(AuthRepository());

//   locator.registerSingleton<IBarberShopRepository>(BarberShopRepository());
//   locator.registerSingleton<IBarberRepository>(BarberRepository());
//   locator.registerSingleton<IHomeRepository>(HomeRepository());
//   locator.registerSingleton<ICategoryRepository>(CategoryRepository());
//   locator.registerSingleton<ICommentRepository>(CommentRepository());
//   locator.registerSingleton<IServicesRepository>(ServicesRepository());

//   //controllers
//   locator.registerSingleton<AuthController>(AuthController());
//   locator.registerSingleton<GlobalController>(GlobalController());
//   locator.registerSingleton<BarberShopController>(BarberShopController());
//   locator.registerSingleton<BarberController>(BarberController());
//   locator.registerSingleton<HomeController>(HomeController());
// }

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_style/auth/data/repository/auth_repository.dart';
import 'package:shop_style/auth/data/repository/otp_repository.dart';
import 'package:shop_style/auth/data/repository/phone_repository.dart';
import 'package:shop_style/auth/data/repository/register_user_repository.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/barber/data/repository/barber_repository.dart';
import 'package:shop_style/barber/data/repository/barber_shop_repository.dart';
import 'package:shop_style/barber/data/repository/comment_repository.dart';
import 'package:shop_style/barber/data/repository/services_repository.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/enums.dart';
import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/home/data/repository/category_repository.dart';
import 'package:shop_style/home/data/repository/home_repository.dart';
import 'package:shop_style/home/statemanagment/home_controller.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(prefs);

  // چک کردن اینکه آیا GlobalController قبلاً ثبت شده است یا نه
  if (!locator.isRegistered<GlobalController>()) {
    locator.registerSingleton<GlobalController>(GlobalController());
  }

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
  locator.registerSingleton<IAuthRepository>(AuthRepository());
  locator.registerSingleton<IBarberShopRepository>(BarberShopRepository());
  locator.registerSingleton<IBarberRepository>(BarberRepository());
  locator.registerSingleton<IHomeRepository>(HomeRepository());
  locator.registerSingleton<ICategoryRepository>(CategoryRepository());
  locator.registerSingleton<ICommentRepository>(CommentRepository());
  locator.registerSingleton<IServicesRepository>(ServicesRepository());

  //controllers
  locator.registerSingleton<AuthController>(AuthController());
  // حذف ثبت مجدد GlobalController از اینجا
  locator.registerSingleton<BarberShopController>(BarberShopController());
  locator.registerSingleton<BarberController>(BarberController());
  locator.registerSingleton<HomeController>(HomeController());
}
