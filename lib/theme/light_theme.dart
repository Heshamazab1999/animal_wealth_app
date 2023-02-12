import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: const Color(0xFF28a880),
  secondaryHeaderColor: const Color(0xFFffcb05),
  disabledColor: const Color(0xFFBABFC4),
  backgroundColor: const Color(0xFFF3F3F3),
  errorColor: const Color(0xFFE84D4F),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF28a880),
    secondary: Color(0xFF28a880),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF28a880),
    ),
  ),
);
