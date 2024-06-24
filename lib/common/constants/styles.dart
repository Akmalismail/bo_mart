import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme get _lightColorScheme => ColorScheme.fromSeed(
        seedColor: AppColors.blue,
        dynamicSchemeVariant: DynamicSchemeVariant.expressive,
        primary: AppColors.blue,
        error: AppColors.red,
        surface: Colors.white,
        // onPrimary: AppColors.red,
        // primaryContainer: AppColors.red,
        // onPrimaryContainer: AppColors.red,
        // primaryFixed: AppColors.red,
        // primaryFixedDim: AppColors.red,
        // onPrimaryFixed: AppColors.red,
        // onPrimaryFixedVariant: AppColors.red,
        // secondary: AppColors.red,
        // onSecondary: AppColors.red,
        // secondaryContainer: AppColors.red,
        // onSecondaryContainer: AppColors.red,
        // secondaryFixed: AppColors.red,
        // secondaryFixedDim: AppColors.red,
        // onSecondaryFixed: AppColors.red,
        // onSecondaryFixedVariant: AppColors.red,
        // tertiary: AppColors.red,
        // onTertiary: AppColors.red,
        // tertiaryContainer: AppColors.red,
        // onTertiaryContainer: AppColors.red,
        // tertiaryFixed: AppColors.red,
        // tertiaryFixedDim: AppColors.red,
        // onTertiaryFixed: AppColors.red,
        // onTertiaryFixedVariant: AppColors.red,
        // onError: AppColors.red,
        // errorContainer: AppColors.red,
        // onErrorContainer: AppColors.red,
        // outline: AppColors.red,
        // outlineVariant: AppColors.red,
        // onSurface: AppColors.red,
        // surfaceDim: AppColors.red,
        // surfaceBright: AppColors.red,
        // surfaceContainerLowest: AppColors.red,
        // surfaceContainerLow: AppColors.red,
        // surfaceContainer: AppColors.red,
        // surfaceContainerHigh: AppColors.red,
        // surfaceContainerHighest: AppColors.red,
        // onSurfaceVariant: AppColors.red,
        // inverseSurface: AppColors.red,
        // onInverseSurface: AppColors.red,
        // inversePrimary: AppColors.red,
        // shadow: AppColors.red,
        // scrim: AppColors.red,
        // surfaceTint: AppColors.red,
        // surfaceVariant: AppColors.red,

        /// Ignored since Container still use these
        /// ignore: deprecated_member_use
        background: Colors.white,
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

        /// Buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _lightColorScheme.primary,
            foregroundColor: _lightColorScheme.onPrimary,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: _lightColorScheme.primary,
            foregroundColor: _lightColorScheme.onPrimary,
          ),
        ),

        /// ColorScheme
        colorScheme: _lightColorScheme,

        /// TextTheme
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 16,
          ),
        ),
        menuTheme: MenuThemeData(
          style: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(
              _lightColorScheme.onPrimary,
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.zero,
            ),
          ),
        ),
      );
}

class AppColors {
  static const Color blue = Color(0xFF01A0F7);
  static const Color green = Color(0xFF02B584);
  static const Color red = Color(0xFFFF161A);
  static const Color grey = Color(0xFFF6F5F5);
}

abstract class AppRadius {
  static const double r4 = 4.0;
}

abstract class AppPadding {
  static const double p5 = 5.0;
  static const double p10 = 10.0;
  static const double p15 = 15.0;
}
