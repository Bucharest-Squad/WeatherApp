import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/hourly_status.dart';
import 'package:weather_app/ui/components/hourly_weather_card.dart';

class HourlyWeatherDetails extends StatelessWidget {
  final List<HourlyStatus> hourlyWeather;

  const HourlyWeatherDetails({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather.length,
        itemBuilder: (context, index) {
          final item = hourlyWeather[index];
          return HourlyWeatherCard(
            weatherCode: item.weatherCode,
            temperature: item.temperature,
            hour: item.hour,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
