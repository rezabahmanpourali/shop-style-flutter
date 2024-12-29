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
      //
      titleLarge: TextStyle(
        color: Color(0xFF0D1619),
        fontWeight: FontWeight.bold,
        fontSize: 40,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF0D1619),
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF000080),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      displaySmall: TextStyle(
        color: Color(0xFF0D1619),
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
