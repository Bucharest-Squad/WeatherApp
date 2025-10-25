import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/theme/font_families.dart';

import '../cubit/theme/theme_cubit.dart';

class HourlyWeatherCard extends StatelessWidget {
  final String weatherImage;

  final String degree;

  final String hour;

  const HourlyWeatherCard({
    super.key,
    required this.weatherImage,
    required this.degree,
    required this.hour,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;
    return SizedBox(
      width: 88,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: 88,
              decoration: BoxDecoration(
                color: theme.colors.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.colors.border, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      degree,
                      style: TextStyle(
                        fontFamily: urbanist,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .25,
                        color: theme.colors.text87,
                      ),
                    ),
                    Text(
                      hour,
                      style: TextStyle(
                        fontFamily: urbanist,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .25,
                        color: theme.colors.text60,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(weatherImage, height: 58, fit: BoxFit.cover),
        ],
      ),
    );
  }
}

var weatherDate = [
  HourlyWeatherData(
    weatherImage: 'assets/images/day_rain_shower_violent.png',
    degree: '25°C',
    hour: '11:00 ',
  ),
  HourlyWeatherData(
    weatherImage: 'assets/images/day_clear_sky.png',
    degree: '21°C',
    hour: '12:00 ',
  ),
  HourlyWeatherData(
    weatherImage: 'assets/images/day_snow_fall_moderate.png',
    degree: '19°C',
    hour: '01:00 ',
  ),
  HourlyWeatherData(
    weatherImage: 'assets/images/day_rain_intensity.png',
    degree: '21°C',
    hour: '02:00 ',
  ),
  HourlyWeatherData(
    weatherImage: 'assets/images/day_mainly_clear.png',
    degree: '25°C',
    hour: '04:00 ',
  ),
  HourlyWeatherData(
    weatherImage: 'assets/images/day_clear_sky.png',
    degree: '25°C',
    hour: '05:00 ',
  ),
  HourlyWeatherData(
    weatherImage: 'assets/images/day_clear_sky.png',
    degree: '25°C',
    hour: '06:00 ',
  ),
  HourlyWeatherData(
    weatherImage: 'assets/images/day_freezing_heavy.png',
    degree: '3',
    hour: '07:00 ',
  ),
];

class HourlyWeatherData {
  final String weatherImage;
  final String degree;
  final String hour;

  const HourlyWeatherData({
    required this.weatherImage,
    required this.degree,
    required this.hour,
  });
}
