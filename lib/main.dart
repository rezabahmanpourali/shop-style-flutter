import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/common/statemanagment/global_controller.dart';
import 'package:shop_style/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MaterialApp(
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
          return const Scaffold(
            body: Center(
              child: Text('init project'),
            ),
          );
        },
      ),
    );
  }
}
