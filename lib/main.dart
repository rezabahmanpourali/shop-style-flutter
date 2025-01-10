import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/View_comments/View_comments_screen.dart';
import 'package:shop_style/auth/screens/login_enter_number_screen.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/barber/screens/barber_shop_page.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_controller.dart';
import 'package:shop_style/barber/statemanagmenrt/barber_shop_controller.dart';
import 'package:shop_style/common/configs/colors.dart';
import 'package:shop_style/common/configs/theme.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/explor/screens/explore_page.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/home/statemanagment/home_controller.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/reserve_page1/screens/service_selection_screen.dart';
import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';
import 'package:shop_style/user_page/screens/user_page.dart';
import 'package:shop_style/view_reserved_page/screens/view_reserved_page.dart';

void main() {
  // Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    MaterialApp(
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
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _pages = [
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
    const Directionality(
      textDirection: TextDirection.rtl,
      child: HomeScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locator.get<GlobalController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator.get<AuthController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator.get<BarberShopController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator.get<BarberController>(),
        ),
        ChangeNotifierProvider(
          create: (context) => locator.get<HomeController>(),
        ),
      ],
      child: Consumer<GlobalController>(
        builder: (context, value, child) {
          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                IndexedStack(
                  index: value.selectedIdex,
                  children: _pages,
                ),
                navBarItems(value),
              ],
            ),
          );
        },
      ),
    );
  }

  Align navBarItems(GlobalController value) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, right: 60, left: 60),
        height: 66,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          color: AppColors.white2,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildNavItem(
                icon: value.selectedIdex == 0
                    ? 'assets/images/Vector.png'
                    : 'assets/images/Person.png',
                label: 'پروفایل',
                index: 0,
                isSelected: value.selectedIdex == 0,
              ),
              _buildNavItem(
                icon: value.selectedIdex == 1
                    ? 'assets/images/Vector (1).png'
                    : 'assets/images/Cart.png',
                label: 'رزرو ها',
                index: 1,
                isSelected: value.selectedIdex == 1,
              ),
              _buildNavItem(
                icon: value.selectedIdex == 2
                    ? 'assets/images/Vector (2).png'
                    : 'assets/images/CategoryStroke.png',
                label: 'جستجو',
                index: 2,
                isSelected: value.selectedIdex == 2,
              ),
              _buildNavItem(
                icon: value.selectedIdex == 3
                    ? 'assets/images/HouseFill (1).png'
                    : 'assets/images/House.png',
                label: 'خانه',
                index: 3,
                isSelected: value.selectedIdex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () {
        locator.get<GlobalController>().update(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isSelected ? 90 : 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.bottomSheetColor,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.purpleOpacity
                : AppColors.bottomSheetColor,
            borderRadius: BorderRadius.circular(51),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isSelected
                  ? Container(
                      margin: const EdgeInsets.only(top: 3, bottom: 3, left: 3),
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: AppColors.purple1,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          label,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: AppColors.white2),
                        ),
                      ),
                    )
                  : const SizedBox(),
              Flexible(
                child: Center(
                  child: Image.asset(
                    icon,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
