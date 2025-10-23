import 'package:weather_app/domain/model/temperature.dart';

class DayForecast {
  final Temperature minTemperature;
  final Temperature maxTemperature;
  final int weatherConditionCode;

  DayForecast({
    required this.minTemperature,
    required this.maxTemperature,
    required this.weatherConditionCode,
  });
}
