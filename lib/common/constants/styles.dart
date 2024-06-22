import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme get _lightColorScheme => ColorScheme.fromSeed(
        seedColor: AppColors.blue,
        primary: AppColors.blue,
        error: AppColors.red,
      );

  static get light => ThemeData(
        /// Font
        fontFamily: 'Montserrat',

        /// AppBar
        appBarTheme: AppBarTheme(
          centerTitle: false,
          titleSpacing: 1,
          backgroundColor: _lightColorScheme.primary,
          foregroundColor: _lightColorScheme.onPrimary,
        ),

        /// ColorScheme
        colorScheme: _lightColorScheme,

        hintColor: Colors.grey.shade600,

        /// TextTheme
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 16,
          ),
        ),
      );
}

class AppColors {
  static const Color blue = Color(0xFF01A0F7);
  static const Color green = Color(0xFF02B584);
  static const Color red = Color(0xFFFF161A);
}

class AppRadius {
  static const double r4 = 4.0;
}
