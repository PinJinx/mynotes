import 'package:flutter/material.dart';

class SetThemeMode with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  void toggleTheme() {
    if (themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF006FFD),
        onPrimary: Colors.white,
        secondary: Color(0xFFEAF2FF),
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black),
    textTheme: TextTheme());

ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF006FFD),
        onPrimary: Colors.white,
        secondary: Color(0xFFEAF2FF),
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.black,
        onSurface: Colors.white),
    textTheme: TextTheme());
