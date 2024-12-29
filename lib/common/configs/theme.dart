import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomTheme {
  ThemeData lighTheme = ThemeData(
    useMaterial3: true,

    // Define the default brightness and colors.
    colorScheme: const ColorScheme.light(
      primary: Color(0xff0D1619),
    ),

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      //
      titleLarge: TextStyle(
        color: AppColors.categoryBlack,
        fontWeight: FontWeight.w700,
        fontFamily: 'IRANSansDB',
        fontSize: 40,
      ),
      titleMedium: TextStyle(
       color: AppColors.categoryBlack,
        fontWeight: FontWeight.w700,
        fontFamily: 'IRANSansDB',
        fontSize: 30,
      ),
      //////////////////////////////////////////
      bodyMedium: TextStyle(
        color:  AppColors.purple,
        fontWeight: FontWeight.w400,
        fontFamily: 'IRANSansDB',
        fontSize: 14,
      ),
      //////////////////////////////////////////
      labelMedium: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'IRANSansDB',
        fontSize: 16,
      ),
      //////////////////////////////////////////

      

      displaySmall: TextStyle(
        color: Color(0xFF0D1619),
        fontSize: 14,
      ),

      displayMedium: TextStyle(
        color: Color(0xFF0D1619),
        fontSize: 18,
      ),

      bodySmall: TextStyle(
        fontSize: 13,
        color: Color(0xFF0D1619),
      ),
      displayLarge: TextStyle(
        fontSize: 13,
        color: Color(0xFF000080),
      ),
      titleSmall: TextStyle(
        color: Color(0xFF0D1619),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFE1E100),
        fontSize: 14,
      ),
    ),
  );
}
