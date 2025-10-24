import 'current_weather_dto.dart';
import 'current_units_dto.dart';
import 'daily_weather_dto.dart';
import 'daily_weather_units_dto.dart';
import 'hourly_weather_dto.dart';
import 'hourly_weather_units_dto.dart';

class WeatherDto {
  final CurrentWeatherDto? currentWeather;
  final CurrentUnitsDto? currentUnits;
  final DailyWeatherDto? dailyWeather;
  final DailyWeatherUnitsDto? dailyWeatherUnits;
  final HourlyWeatherDto? hourly;
  final HourlyWeatherUnitsDto? hourlyWeatherUnits;

  WeatherDto({
    this.currentWeather,
    this.currentUnits,
    this.dailyWeather,
    this.dailyWeatherUnits,
    this.hourly,
    this.hourlyWeatherUnits,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return WeatherDto(
      currentWeather: json['current'] != null
          ? CurrentWeatherDto.fromJson(json['current'])
          : null,
      currentUnits: json['current_units'] != null
          ? CurrentUnitsDto.fromJson(json['current_units'])
          : null,
      dailyWeather: json['daily'] != null
          ? DailyWeatherDto.fromJson(json['daily'])
          : null,
      dailyWeatherUnits: json['daily_units'] != null
          ? DailyWeatherUnitsDto.fromJson(json['daily_units'])
          : null,
      hourly: json['hourly'] != null
          ? HourlyWeatherDto.fromJson(json['hourly'])
          : null,
      hourlyWeatherUnits: json['hourly_units'] != null
          ? HourlyWeatherUnitsDto.fromJson(json['hourly_units'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current': currentWeather?.toJson(),
      'current_units': currentUnits?.toJson(),
      'daily': dailyWeather?.toJson(),
      'daily_units': dailyWeatherUnits?.toJson(),
      'hourly': hourly?.toJson(),
      'hourly_units': hourlyWeatherUnits?.toJson(),
    };
  }
}
