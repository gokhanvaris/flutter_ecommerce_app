import 'package:flutter/material.dart';

class AppDefaultTheme {
  static const whiteBackground = Colors.white;
  static const greyBackGround = Colors.grey;
  ThemeData themeData = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(249, 249, 249, 1),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.teal,
        ),
      ),
      scaffoldBackgroundColor:
          const Color.fromRGBO(60, 38, 147, 1),
      canvasColor: Colors.white,
      textTheme: const TextTheme(
        headline6: TextStyle(
          color: Color.fromRGBO(100, 71, 202, 1),
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
        bodyText1: TextStyle(),
      ).apply());
}
