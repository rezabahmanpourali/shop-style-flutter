import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/auth/statemanagment/auth_controller.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/explor/screens/explore_page.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/locator.dart';
import 'package:shop_style/reserve_page2/screens/reseve_page2.dart';
import 'package:shop_style/reserve_page3/screens/reserve_page3.dart';
import 'package:shop_style/reserve_page4/screen/reserve_page4.dart';
import 'package:shop_style/reserve_page5/screen/reseve_page5.dart';
import 'package:shop_style/user_page/screens/user_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'IRANYekanFn',
            fontSize: 11,
          ),
        ),
      ),
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
  // تعریف متغیر برای پیگیری انتخاب بخش
  int _selectedIndex = 0;

  // لیست صفحات مربوط به هر بخش
  final List<Widget> _pages = [
    Directionality(
      textDirection: TextDirection.rtl,
      child: UserPage(),
    ),
    // Container(
    //   color: Colors.green,
    //   child: const Center(
    //     child: Text('Developing'),
    //   ),
    // ), // صفحه اکتشاف

    Container(
      color: Colors.red,
      child: const Center(
        child: Text('Developing'),
      ),
    ), // صفحه خانه
    const Directionality(
      textDirection: TextDirection.rtl,
      child: ExplorePage(),
    ), // صفحه آرایشگاه
    const Directionality(
      textDirection: TextDirection.rtl,
      child: HomeScreen(),
    ), // صفحه ورود
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
      ],
      child: Consumer<GlobalController>(
        builder: (context, value, child) {
          return Scaffold(
            body: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              elevation: 0,
              selectedItemColor: const Color(0xFF000080),
              unselectedItemColor: const Color(0xFFA6A6D3),
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(
                color: Color(0xFF000080),
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
              unselectedLabelStyle: const TextStyle(
                color: Color(0xFFA6A6D3),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/Person.png',
                  ),
                  label: 'حساب کاربری',
                  activeIcon: Image.asset('assets/images/homeActive.jpg'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/Cart.png'),
                  label: 'رزرو شده ها',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/CategoryStroke.png'),
                  label: 'جستجوی آرایشگاه',
                  activeIcon: Image.asset('assets/images/CategoryFill.png'),
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/House.jpg'),
                  label: 'خانه',
                  activeIcon: Image.asset('assets/images/HouseFill.png'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
