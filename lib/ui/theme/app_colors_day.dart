import 'package:flutter/material.dart';
import 'package:weather_app/ui/theme/app_colors.dart';

class DayAppColors extends AppColors {
  @override
  Color get primary => const Color(0xFF87CEFA);

  @override
  Color get onPrimary => const Color(0xFF000000);

  @override
  Color get accent => const Color(0xFF87CEFA);

  @override
  Color get text => const Color(0xFF000000);

  @override
  Color get text60 => const Color(0x99000000);

  @override
  Color get text87 => const Color(0xDE000000);

  @override
  Color get background => const Color(0xB3FFFFFF);

  @override
  Color get elementBackgroundColor => const Color(0xFF060414);

  @override
  Color get backgroundStart => const Color(0xFF87CEFA);

  @override
  Color get backgroundEnd => const Color(0xFFFFFFFF);

  @override
  Color get border => const Color(0x14060414);

  @override
  Color get weatherIconColor => const Color(0xFF00619D);

  @override
  Color get glassmorphismBackground => const Color(0x33FFFFFF);

  @override
  Color get glassmorphismBorder => const Color(0x4DFFFFFF);

  @override
  Color get cardShadow => const Color(0x1A000000);

  @override
  Color get temperatureColor => const Color(0xFF060414);

  @override
  Color get statusColor => const Color(0x99060414);

  @override
  Color get locationColor => const Color(0xFF323232);

  @override
  Color get maxMinCardBackground => const Color(0x14060414);

  @override
  Color get maxMinDividerColor => const Color(0x99060414);

  @override
  Color get maxMinTextColor => const Color(0x99060414);
}
