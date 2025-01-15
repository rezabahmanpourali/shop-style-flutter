import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
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
import 'package:shop_style/user_page/screens/user_page.dart';
import 'package:shop_style/view_reserved_page/screens/view_reserved_page.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    MaterialApp(
       supportedLocales: [
        Locale('en', 'US'),  // زبان انگلیسی
        Locale('fa', 'IR'),  // زبان فارسی
        // می‌توانید زبان‌های دیگر را هم اضافه کنید
      ],
      localizationsDelegates: [
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
    Directionality(
      textDirection: TextDirection.rtl,
      child: HomeScreen(),
    ),
  ];

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
        builder: (context, value, child) {
          return Scaffold(
            extendBody: false,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: IndexedStack(
              index: value.selectedIdex,
              children: _pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: value.selectedIdex,
              onTap: (int selectedIndex) {
                value.update(selectedIndex);
              },
              selectedItemColor: AppColors.purpleOpacity, // رنگ آیکن انتخابی
              selectedFontSize: 10,
              unselectedFontSize: 10,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
              unselectedItemColor: Colors.grey, // رنگ آیکن‌های غیرفعال
              showUnselectedLabels: true, // نمایش برچسب‌های غیرفعال
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/images/PersonFill.svg'),
                  icon: SvgPicture.asset('assets/images/Person.svg'),
                  label: 'حساب کاربری',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/images/CartFill.svg'),
                  icon: SvgPicture.asset('assets/images/Cart.svg'),
                  label: 'رزرو شده ها',
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      SvgPicture.asset('assets/images/locationActive.svg'),
                  icon: SvgPicture.asset('assets/images/locationOnActive.svg'),
                  label: 'جستجوی آرایشگاه',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/images/HouseFill.svg'),
                  icon: SvgPicture.asset('assets/images/homeOnActive.svg'),
                  label: 'خانه',
                ),
              ],
            ),
            // extendBody: true,
            // extendBodyBehindAppBar: true,
            // body: Stack(
            //   children: [
            //     IndexedStack(
            //       index: value.selectedIdex,
            //       children: _pages,
            //     ),
            //   ],
            // ),

            // backgroundColor: Colors.transparent,
            // bottomNavigationBar: CurvedNavigationBar(
            //   backgroundColor: AppColors.white2,
            //   color: AppColors.purpleOpacity,
            //   height: 60,
            //   animationDuration: Duration(milliseconds: 300),
            //   onTap: (int selectedIndex) {
            //     locator.get<GlobalController>().update(selectedIndex);
            //   },
            //   buttonBackgroundColor: AppColors.purpleOpacity,
            //   items: [
            //     Image.asset(
            //       'assets/images/Vector.png',
            //       width: 30,
            //     ),
            //     Image.asset(
            //       'assets/images/Vector (1).png',
            //       width: 30,
            //     ),
            //     Image.asset(
            //       'assets/images/Vector (2).png',
            //       width: 30,
            //     ),
            //     Image.asset(
            //       'assets/images/HouseFill (1).png',
            //       width: 30,
            //     ),
            //   ],
            // ),
          );
        },
      ),
    );
  }

  // Align navBarItems(GlobalController value) {
  //   return Align(
  //     alignment: Alignment.bottomCenter,
  //     child: Container(
  //       margin: const EdgeInsets.only(bottom: 20, right: 60, left: 60),
  //       height: 66,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(56),
  //         color: AppColors.white2,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black.withOpacity(0.2),
  //             blurRadius: 10,
  //             offset: const Offset(0, -2),
  //           ),
  //         ],
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 8, right: 8),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: <Widget>[
  //             _buildNavItem(
  //               icon: value.selectedIdex == 0
  //                   ? 'assets/images/Vector.png'
  //                   : 'assets/images/Person.png',
  //               label: 'پروفایل',
  //               index: 0,
  //               isSelected: value.selectedIdex == 0,
  //             ),
  //             _buildNavItem(
  //               icon: value.selectedIdex == 1
  //                   ? 'assets/images/Vector (1).png'
  //                   : 'assets/images/Cart.png',
  //               label: 'رزرو ها',
  //               index: 1,
  //               isSelected: value.selectedIdex == 1,
  //             ),
  //             _buildNavItem(
  //               icon: value.selectedIdex == 2
  //                   ? 'assets/images/Vector (2).png'
  //                   : 'assets/images/CategoryStroke.png',
  //               label: 'جستجو',
  //               index: 2,
  //               isSelected: value.selectedIdex == 2,
  //             ),
  //             _buildNavItem(
  //               icon: value.selectedIdex == 3
  //                   ? 'assets/images/HouseFill (1).png'
  //                   : 'assets/images/House.png',
  //               label: 'خانه',
  //               index: 3,
  //               isSelected: value.selectedIdex == 3,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   Widget _buildNavItem({
//     required String icon,
//     required String label,
//     required int index,
//     required bool isSelected,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         locator.get<GlobalController>().update(index);
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         width: isSelected ? 90 : 50,
//         height: 50,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           color: AppColors.bottomSheetColor,
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             color: isSelected
//                 ? AppColors.purpleOpacity
//                 : AppColors.bottomSheetColor,
//             borderRadius: BorderRadius.circular(51),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               isSelected
//                   ? Container(
//                       margin: const EdgeInsets.only(top: 3, bottom: 3, left: 3),
//                       width: 44,
//                       height: 44,
//                       decoration: const BoxDecoration(
//                         color: AppColors.purple1,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Center(
//                         child: Text(
//                           label,
//                           style: Theme.of(context)
//                               .textTheme
//                               .displayLarge
//                               ?.copyWith(color: AppColors.white2),
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//               Flexible(
//                 child: Center(
//                   child: Image.asset(
//                     icon,
//                     width: 24,
//                     height: 24,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
}
