import 'package:flutter/material.dart';

abstract class AppColors {
  Color get primary;

  Color get onPrimary;

  Color get accent;

  Color get text;

  Color get text60;

  Color get text87;

  Color get background;

  Color get elementBackgroundColor;

  Color get backgroundStart;

  Color get backgroundEnd;

  LinearGradient get backgroundGradient => LinearGradient(
    colors: [backgroundStart, backgroundEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  Color get border;
}
