import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'max_min_temp_card.dart';
import '../cubit/theme/theme_cubit.dart';
import 'package:weather_app/ui/theme/font_families.dart';
import '../model/current_weather.dart';

class CurrentWeatherCard extends StatelessWidget {
  final CurrentWeather currentWeather;

  const CurrentWeatherCard({
    super.key,
    required this.currentWeather,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context
        .watch<ThemeCubit>()
        .state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 250,
            height: 250,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: -15,
                  top: 5,
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Color.fromRGBO(
                            theme.colors.weatherIconColor.red,
                            theme.colors.weatherIconColor.green,
                            theme.colors.weatherIconColor.blue,
                            0.25,
                          ),
                          Color.fromRGBO(
                            theme.colors.weatherIconColor.red,
                            theme.colors.weatherIconColor.green,
                            theme.colors.weatherIconColor.blue,
                            0.08,
                          ),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.3, 1.0],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(
                            theme.colors.weatherIconColor.red,
                            theme.colors.weatherIconColor.green,
                            theme.colors.weatherIconColor.blue,
                            0.2,
                          ),
                          blurRadius: 70,
                          spreadRadius: 5,
                          offset: const Offset(-5, 5),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  child: SizedBox(
                    width: 220,
                    height: 200,
                    child: Image.asset(
                      currentWeather.image,
                      width: 220,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Text(
            '${currentWeather.temperature}${currentWeather.unit}',
            style: TextStyle(
              fontFamily: urbanist,
              fontSize: 64,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.25,
              color: theme.colors.temperatureColor,
              height: 1.0,
            ),
          ),

          Text(
            currentWeather.status,
            style: TextStyle(
              fontFamily: urbanist,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.25,
              color: theme.colors.statusColor,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 12),

          MaxMinTempCard(
            highTemp: currentWeather.highTemp,
            lowTemp: currentWeather.lowTemp,
            unit: currentWeather.unit,
          ),
        ],
      ),
    );
  }
}