import 'package:flutter/material.dart';


class AppTheme {
  
  static const Color primaryColor   = Color(0xff8FC6BB);
  static const Color secondaryColor = Color(0xffC68F9A);

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
      unselectedLabelColor: Colors.white
    )
  );

}