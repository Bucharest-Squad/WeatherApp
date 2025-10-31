import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../cubit/theme/theme_cubit.dart';

class LocationRow extends StatelessWidget {
  const LocationRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      children: [
        SvgPicture.asset(
          'assets/images/location.svg',
          colorFilter: ColorFilter.mode(theme.colors.text, BlendMode.srcIn),
        ),
        Text(
          'Location',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: theme.colors.text,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
