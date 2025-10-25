import '../model/current_day_weather_status.dart';
import '../model/day_forecast.dart';
import '../model/hourly_status.dart';
import '../model/temperature.dart';

class Weather {
  final Temperature currentTemperature;
  final TodayWeatherStatus currentDayWeatherStatus;
  final List<HourlyStatus> hourlyStatus;
  final DayForecast currentDayForecast;
  final List<DayForecast> nextDaysForecast;
  final bool isDaytime;

  Weather({
    required this.currentTemperature,
    required this.currentDayWeatherStatus,
    required this.hourlyStatus,
    required this.currentDayForecast,
    required this.nextDaysForecast,
    required this.isDaytime,
  });
}
