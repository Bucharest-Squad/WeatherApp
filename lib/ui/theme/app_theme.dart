import 'package:flutter/material.dart';
import 'package:weather_app/gen/fonts.gen.dart';
import 'package:weather_app/ui/theme/app_colors.dart';

abstract class AppTheme {
  final Brightness brightness;
  final AppColors colors;

  AppTheme({required this.brightness, required this.colors});

  ThemeData get themeData {
    return ThemeData(
      fontFamily: FontFamily.urbanist,
      brightness: brightness,
      primaryColor: colors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colors.primary,
        brightness: brightness,
        primary: colors.primary,
        secondary: colors.accent,
        onPrimary: colors.onPrimary,
        onSurface: colors.text,
      ),
    );
  }
}
