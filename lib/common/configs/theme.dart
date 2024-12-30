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
        fontSize: 25,
      ),
      titleSmall: TextStyle(
        color: AppColors.categoryBlack,
        fontWeight: FontWeight.w700,
        fontFamily: 'IRANSansDB',
        fontSize: 20,
      ),
      //////////////////////////////////////////
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontFamily: 'IRANSansDB',
        fontSize: 14,
      ),
      bodyMedium: TextStyle(
        color: AppColors.purple,
        fontWeight: FontWeight.w400,
        fontFamily: 'IRANSansDB',
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColors.yellow,
        fontWeight: FontWeight.w700,
        fontFamily: 'IRANSansDB',
        fontSize: 12,
      ),
      //////////////////////////////////////////
      labelMedium: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'IRANSansDB',
        fontSize: 16,
      ),
      labelSmall: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
        fontFamily: 'IRANSansDB',
        fontSize: 16,
      ),
      //////////////////////////////////////////
      displayMedium: TextStyle(
        color: AppColors.textHeader,
        fontWeight: FontWeight.w400,
        fontFamily: 'IRANYekanFn',
        fontSize: 12,
      ),
      displaySmall: TextStyle(
        color: AppColors.textHeader,
        fontWeight: FontWeight.w400,
        fontFamily: 'IRANYekanFn',
        fontSize: 11,
      ),
    ),
  );
}
