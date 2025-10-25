import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/theme/font_families.dart';
import '../cubit/theme/theme_cubit.dart';
import '../model/weather_info.dart';

class WeatherDetails extends StatelessWidget {
  final List<WeatherInfo> weatherInfo;

  const WeatherDetails({super.key, required this.weatherInfo});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth < 600 ? 3 : 6;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            mainAxisExtent: 131,
          ),
          itemCount: weatherInfo.length,
          itemBuilder: (context, index) {
            return WeatherDetailsCard(info: weatherInfo[index]);
          },
        );
      },
    );
  }
}

class WeatherDetailsCard extends StatelessWidget {
  final WeatherInfo info;

  const WeatherDetailsCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;
    return Card(
      elevation: 0,
      color: theme.colors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(color: theme.colors.border, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(info.iconPath),
          const SizedBox(height: 8),
          Text(
            info.value,
            style: TextStyle(
              fontFamily: urbanist,
              color: theme.colors.text87,
              fontSize: 20,
              letterSpacing: 0.25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            info.label,
            style: TextStyle(
              fontFamily: urbanist,
              color: theme.colors.text60,
              fontSize: 14,
              letterSpacing: 0.25,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
