import 'package:weather_app/domain/model/atmospheric_pressure.dart';
import 'package:weather_app/domain/model/speed.dart';
import 'package:weather_app/domain/model/temperature.dart';

class TodayWeatherStatus {
  final Speed windSpeed;
  final double humidity;
  final double rain;
  final double uvIndex;
  final AtmosphericPressure pressure;
  final Temperature feelsLike;

  TodayWeatherStatus({
    required this.windSpeed,
    required this.humidity,
    required this.rain,
    required this.uvIndex,
    required this.pressure,
    required this.feelsLike,
  });
}
