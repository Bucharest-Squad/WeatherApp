import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/theme/theme_cubit.dart';
import 'package:weather_app/ui/theme/font_families.dart';

class MaxMinTempCard extends StatelessWidget {
  final String highTemp;
  final String lowTemp;
  final String unit;

  const MaxMinTempCard({
    super.key,
    required this.highTemp,
    required this.lowTemp,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '↑ $highTemp$unit',
          style: TextStyle(
              fontFamily: urbanist,
              fontSize: 20,
              color: theme.colors.text87,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 15),
        Text(
          '↓ $lowTemp$unit',
          style: TextStyle(
              fontFamily: urbanist,
              fontSize: 20,
              color: theme.colors.text60),
        ),
      ],
    );
  }
}