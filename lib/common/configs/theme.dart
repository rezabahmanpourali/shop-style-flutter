import 'package:flutter/material.dart';

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
      displayLarge: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      //
      titleLarge: TextStyle(
        color: Color(0xFF0D1619),
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF000080),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        color: Color(0xFFBABABA),
        fontSize: 18,
      ),
      displayMedium: TextStyle(
        color: Color(0xFF0D1619),
        fontSize: 18,
      ),
      labelMedium: TextStyle(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
