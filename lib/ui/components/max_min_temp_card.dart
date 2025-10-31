import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/gen/assets.gen.dart';
import 'package:weather_app/ui/theme/font_families.dart';
import '../cubit/theme/theme_cubit.dart';

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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colors.maxMinCardBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 12,
            height: 12,
            child: Assets.images.arrowUp.svg(
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                theme.colors.maxMinTextColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$highTemp$unit',
            style: TextStyle(
              fontFamily: urbanist,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.25,
              color: theme.colors.maxMinTextColor,
              height: 1.0,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 1,
            height: 20,
            decoration: BoxDecoration(
              color: theme.colors.maxMinDividerColor,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 12,
            height: 12,
            child: Assets.images.arrowDown.svg(
              width: 12,
              height: 12,
              colorFilter: ColorFilter.mode(
                theme.colors.maxMinTextColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$lowTemp$unit',
            style: TextStyle(
              fontFamily: urbanist,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.25,
              color: theme.colors.maxMinTextColor,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}