import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: const Color(0xFF28a880),
  secondaryHeaderColor: const Color(0xFFffcb05),
  disabledColor: const Color(0xffa2a7ad),
  backgroundColor: const Color(0xFF343636),
  errorColor: const Color(0xFFdd3135),
  brightness: Brightness.dark,
  hintColor: const Color(0xFFbebebe),
  cardColor: Colors.black,
  colorScheme: const ColorScheme.dark(
      primary: Color(0xFF28a880), secondary: Color(0xFF28a880),),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFF28a880),)),
);
