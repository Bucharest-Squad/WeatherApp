import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/model/temperature.dart';
import '../cubit/theme/theme_cubit.dart';

class HourlyWeatherCard extends StatelessWidget {
  final int hour;
  final Temperature temperature;
  final int weatherCode;

  const HourlyWeatherCard({
    super.key,
    required this.weatherCode,
    required this.temperature,
    required this.hour,
  });

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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${temperature.temperature.round()}°${temperature.unit.name.substring(0, 1).toUpperCase()}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .25,
                        color: theme.colors.text87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$hour:00",
                      style: TextStyle(
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
          Image.asset(
            getWeatherImagePathByCode(weatherCode),
            height: 58,
          ),
        ],
      ),
    );
  }
}

String getWeatherImagePathByCode(int weatherCode, {bool isDay = true}) {
  final condition = getWeatherConditionByCode(weatherCode);
  return isDay ? condition.dayImagePath : condition.nightImagePath;
}

WeatherCondition getWeatherConditionByCode(int code) {
  return WeatherCondition.values.firstWhere(
        (condition) => condition.weatherCode == code,
    orElse: () => WeatherCondition.unknownWeatherForecast,
  );
}

enum WeatherCondition {
  clearSky(
    0,
    "Clear Sky",
    "assets/images/day_clear_sky.png",
    "assets/images/night_clear_sky.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  mainlyClear(
    1,
    "Mainly Clear",
    "assets/images/day_mainly_clear.png",
    "assets/images/night_mainly_clear.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  partlyCloudy(
    2,
    "Partly Cloudy",
    "assets/images/day_partly_cloudy.png",
    "assets/images/night_partly_cloudy.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  overcast(
    3,
    "Overcast",
    "assets/images/day_overcast.png",
    "assets/images/night_overcast.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  fog(
    45,
    "Fog",
    "assets/images/day_fog.png",
    "assets/images/night_fog.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  depositingRimeFog(
    48,
    "Depositing Rime Fog",
    "assets/images/day_fog.png",
    "assets/images/night_fog.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  drizzleLight(
    51,
    "Light Drizzle",
    "assets/images/day_drizzle_light.png",
    "assets/images/night_drizzle_light.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  drizzleModerate(
    53,
    "Moderate Drizzle",
    "assets/images/day_drizzle_moderate.png",
    "assets/images/night_drizzle_moderate.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  drizzleHigh(
    55,
    "High Drizzle",
    "assets/images/day_drizzle_intensity.png",
    "assets/images/night_drizzle_intensity.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  freezingDrizzleLight(
    56,
    "Light Freezing Drizzle",
    "assets/images/day_drizzle_light.png",
    "assets/images/night_drizzle_light.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  freezingDrizzleHigh(
    57,
    "High Freezing Drizzle",
    "assets/images/day_freezing_drizzle_intensity.png",
    "assets/images/night_freezing_drizzle_intensity.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  rainLight(
    61,
    "Light Rain",
    "assets/images/day_rain_slight.png",
    "assets/images/night_rain_slight.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  rainModerate(
    63,
    "Moderate Rain",
    "assets/images/day_rain_moderate.png",
    "assets/images/night_rain_moderate.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  rainHeavy(
    65,
    "Heavy Rain",
    "assets/images/day_rain_intensity.png",
    "assets/images/night_rain_intensity.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  freezingRainLight(
    66,
    "Light Freezing Rain",
    "assets/images/day_freezing_light.png",
    "assets/images/night_freezing_light.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  freezingRainHigh(
    67,
    "High Freezing Rain",
    "assets/images/day_freezing_heavy.png",
    "assets/images/night_freezing_heavy.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  snowLight(
    71,
    "Light Snow",
    "assets/images/day_snow_fall_light.png",
    "assets/images/night_snow_fall_light.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  snowModerate(
    73,
    "Moderate Snow",
    "assets/images/day_snow_fall_moderate.png",
    "assets/images/night_snow_fall_moderate.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  snowHeavy(
    75,
    "Heavy Snow",
    "assets/images/day_snow_fall_intensity.png",
    "assets/images/night_snow_fall_intensity.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  snowGrains(
    77,
    "Grains Snow",
    "assets/images/day_snow_grains.png",
    "assets/images/night_snow_grains.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  rainShowerLight(
    80,
    "Light Rain Shower",
    "assets/images/day_rain_shower_slight.png",
    "assets/images/night_rain_shower_slight.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  rainShowerModerate(
    81,
    "Moderate Rain Shower",
    "assets/images/day_rain_shower_moderate.png",
    "assets/images/night_rain_shower_moderate.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  rainShowerHeavy(
    82,
    "Heavy Rain Shower",
    "assets/images/day_rain_shower_violent.png",
    "assets/images/night_rain_shower_violent.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  snowShowerLight(
    85,
    "Light Snow Shower",
    "assets/images/day_snow_shower_slight.png",
    "assets/images/night_snow_shower_slight.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  snowShowerHeavy(
    86,
    "Heavy Snow Shower",
    "assets/images/day_snow_shower_heavy.png",
    "assets/images/night_snow_shower_heavy.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  thunderStorm(
    95,
    "Thunderstorm",
    "assets/images/day_thunderstrom_slight_or_moderate.png",
    "assets/images/night_thunderstrom_slight_or_moderate.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  thunderStormHailLight(
    96,
    "Thunderstorm with Light Hail",
    "assets/images/day_thunderstrom_with_slight_hail.png",
    "assets/images/night_thunderstrom_with_slight_hail.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  thunderStormHailHeavy(
    99,
    "Thunderstorm with Heavy Hail",
    "assets/images/day_thunderstrom_with_heavy_hail.png",
    "assets/images/night_thunderstrom_with_heavy_hail.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  ),
  unknownWeatherForecast(
    -1,
    "Unknown Weather Forecast",
    "assets/images/day_clear_sky.png",
    "assets/images/night_clear_sky.png",
    Color(0xFFFFC701),
    Color(0xFF7E2FFF),
  );

  const WeatherCondition(
    this.weatherCode,
    this.stateName,
    this.dayImagePath,
    this.nightImagePath,
    this.dayShadowColor,
    this.nightShadowColor,
  );

  final int weatherCode;
  final String stateName;
  final String dayImagePath;
  final String nightImagePath;
  final Color dayShadowColor;
  final Color nightShadowColor;
}
