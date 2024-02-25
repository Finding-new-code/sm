import 'package:flutter/material.dart';

class AppThemeMode {
  /// these are for the dark theme settings =>
  ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.white12,
        contentTextStyle: const TextStyle(color: Colors.white),
        actionTextColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      colorSchemeSeed: const Color.fromARGB(255, 53, 3, 85),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black54,
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
      cardTheme: const CardTheme(
        color: Colors.black,
      ));

  /// these are for the light theme settings =>
  ThemeData light = ThemeData(
      brightness: Brightness.light,
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.white,
        contentTextStyle: const TextStyle(color: Colors.black),
        actionTextColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      colorSchemeSeed: const Color.fromARGB(255, 53, 3, 85),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      cardTheme: const CardTheme(
        color: Colors.white,
      ));
}
