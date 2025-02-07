import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/barber/model/barber_shop_saved_model.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/theme.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/explor/screens/explore_page.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/statemanagment/home_controller.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/onboard_screen/screen/onboard_screen.dart';
import 'package:shop_style/test_widgets/point_dialog.dart';
import 'package:shop_style/test_widgets_screen.dart';
import 'package:shop_style/user_page/screens/user_page.dart';
import 'package:shop_style/view_reserved_page/screens/view_reserved_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // فایل لوکالیزیشن

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // مقداردهی اولیه کنترلرها
  await Hive.initFlutter();
  Hive.registerAdapter(BarberShopSavedModelAdapter());
  await Hive.openBox<BarberShopSavedModel>('CardBox');
  await Hive.openBox<BarberShopSavedModel>('recentVisitsBox');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: locator.get<GlobalController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<AuthController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<BarberShopController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<BarberController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<HomeController>(),
        ),
      ],
      child: Consumer<GlobalController>(
        builder: (context, globalController, child) {
          return MaterialApp(
            locale: Locale(globalController.language),
            supportedLocales: const [
              Locale('en', ''), // زبان انگلیسی
              Locale('fa', ''), // زبان فارسی
              Locale('ar', ''), // زبان عربی
              Locale('tr', ''), // زبان ترکی
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            color: Colors.transparent,
            theme: CustomTheme().lighTheme,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown,
              },
            ),
            home: const OnbordScreen(),
            builder: (context, child) {
              return Directionality(
                textDirection: globalController.language == 'fa' ||
                        globalController.language == 'ar'
                    ? TextDirection.ltr
                    : TextDirection.ltr,
                child: child!,
              );
            },
          );
        },
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: locator.get<GlobalController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<AuthController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<BarberShopController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<BarberController>(),
        ),
        ChangeNotifierProvider.value(
          value: locator.get<HomeController>(),
        ),
      ],
      child: Consumer<GlobalController>(
        builder: (context, globalController, child) {
          // تغییر ترتیب نوار پیمایش بر اساس زبان
          final List<BottomNavigationBarItem> navigationItems = globalController
                          .language ==
                      'fa' ||
                  globalController.language == 'ar'
              ? [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/PersonFill.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/Person.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.account_info,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/CartFill.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/Cart.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.reservation_history,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/locationActive.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/locationOnActive.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.salon_list,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/HouseFill.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/homeOnActive.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.home,
                  ),
                ]
              : [
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/HouseFill.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/homeOnActive.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/locationActive.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/locationOnActive.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.salon_list,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/CartFill.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/Cart.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.reservation_history,
                  ),
                  BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset(
                      'assets/images/PersonFill.svg',
                      color: AppColors.tankBlue3,
                    ),
                    icon: SvgPicture.asset(
                      'assets/images/Person.svg',
                      color: AppColors.tankBlueOpacity100,
                    ),
                    label: AppLocalizations.of(context)!.account_info,
                  ),
                ];

          final List<Widget> pages = globalController.language == 'en' ||
                  globalController.language == 'tr'
              ? [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: HomeScreen(),
                  ),
                  const Directionality(
                    textDirection: TextDirection.ltr,
                    child: ExplorePage(),
                  ),
                  const Directionality(
                    textDirection: TextDirection.ltr,
                    child: ViewReservedPage(),
                  ),
                  const Directionality(
                    textDirection: TextDirection.ltr,
                    child: UserPage(),
                  ),
                ]
              : [
                  const Directionality(
                    textDirection: TextDirection.rtl,
                    child: UserPage(),
                  ),
                  const Directionality(
                    textDirection: TextDirection.rtl,
                    child: ViewReservedPage(),
                  ),
                  const Directionality(
                    textDirection: TextDirection.rtl,
                    child: ExplorePage(),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: HomeScreen(),
                  ),
                ];

          return Scaffold(
            extendBody: false,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: IndexedStack(
              index: globalController.selectedIndex,
              children: pages, // لیست صفحات
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: globalController.selectedIndex,
              onTap: (int selectedIndex) {
                globalController.update(selectedIndex);
              },
              selectedItemColor: AppColors.tankBlue3, // رنگ آیکن انتخابی
              selectedFontSize: 10,
              unselectedFontSize: 10,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w500),
              unselectedItemColor:
                  AppColors.tankBlueOpacity100, // رنگ آیکن‌های غیرفعال
              showUnselectedLabels: true, // نمایش برچسب‌های غیرفعال
              items: navigationItems, // استفاده از آیتم‌ها بر اساس زبان
              type: BottomNavigationBarType.fixed,
              elevation: 15,
            ),
          );
        },
      ),
    );
  }
}
