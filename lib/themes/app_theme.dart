import 'package:flutter/material.dart';

final appTheme = ThemeData.dark().copyWith(

  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.red
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.red
  )

);