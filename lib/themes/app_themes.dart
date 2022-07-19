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
    ),

    inputDecorationTheme: InputDecorationTheme(
      alignLabelWithHint: true,
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder,
      focusedErrorBorder: _errorBorder,
      errorBorder: _errorBorder
    ),

    toggleButtonsTheme: ToggleButtonsThemeData(
      borderWidth: 2,
      borderRadius: BorderRadius.circular(10),
    )
  );

  static final _inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 2, color: primaryColor),
    borderRadius: BorderRadius.circular(10)
  );

  static final _errorBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 2, color: Colors.red),
    borderRadius: BorderRadius.circular(10)
  );

}