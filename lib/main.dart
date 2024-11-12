import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/home/screens/home_screen.dart';
import 'package:shop_style/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MaterialApp(
    scrollBehavior: const MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.mouse,
        PointerDeviceKind.touch,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      },
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => locator.get<GlobalController>(),
        )
      ],
      child: Consumer<GlobalController>(
        builder: (context, value, child) {
          return HomeScreen();
        },
      ),
    );
  }
}
