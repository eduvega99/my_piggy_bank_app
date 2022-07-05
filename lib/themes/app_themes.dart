import 'package:flutter/material.dart';


class AppTheme {
  
  static const Color primaryColor   = Color(0xff194775);
  static const Color secondaryColor = Color(0xffff8800);

  static final ThemeData theme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: secondaryColor,
      unselectedLabelColor: Colors.white,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 16)
    )
  );

}