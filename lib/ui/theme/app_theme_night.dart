import 'package:flutter/material.dart';
import 'package:weather_app/ui/theme/app_colors_night.dart';
import 'app_theme.dart';

class NightTheme extends AppTheme {
  NightTheme() : super(brightness: Brightness.dark, colors: NightAppColors());
}
