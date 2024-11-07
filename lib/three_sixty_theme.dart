import 'package:flutter/material.dart';

final ThemeData threeSixtyTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.darkBlue,
    onPrimary: Colors.white,
    secondary: Colors.medBlue,
    onSecondary: Colors.white,
    error: Colors.orange,
    onError: Colors.black,
    surface: Colors.tan,
    onSurface: Colors.black,
    onTertiary: Colors.black,
    tertiary: Colors.lightBlue,
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
      color: Colors.medBlue,
    ),
    headlineMedium: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.medBlue,
    ),
    bodyMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      color: Colors.medBlue,
    ),
    labelMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.medBlue,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: Colors.lightBlue,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.white,
    ),
    selectedLabelStyle: TextStyle(
      color: Colors.white,
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.white,
    ),
  ),
);

class Colors {
  static Color darkBlue = const Color.fromRGBO(0, 31, 63, 1);
  static Color medBlue = const Color.fromRGBO(58, 109, 140, 1);
  static Color lightBlue = const Color.fromRGBO(106, 154, 176, 1);
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color black = const Color.fromRGBO(0, 0, 0, 1);
  static Color tan = const Color.fromRGBO(234, 216, 177, 1);
  static Color orange = const Color.fromRGBO(255, 153, 51, 1);
}
