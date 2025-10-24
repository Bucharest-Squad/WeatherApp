import 'package:json_annotation/json_annotation.dart';

class CurrentUnitsDto {
  final String? apparentTemperatureUnit;
  final String? rainUnit;
  final String? relativeHumidityUnit;
  final String? surfacePressureUnit;
  final String? temperatureUnit;
  final String? timeUnit;
  final String? windSpeedUnit;

  CurrentUnitsDto({
    this.apparentTemperatureUnit,
    this.rainUnit,
    this.relativeHumidityUnit,
    this.surfacePressureUnit,
    this.temperatureUnit,
    this.timeUnit,
    this.windSpeedUnit,
  });

  factory CurrentUnitsDto.fromJson(Map<String, dynamic> json) {
    return CurrentUnitsDto(
      apparentTemperatureUnit: json['apparent_temperature'] as String?,
      rainUnit: json['rain'] as String?,
      relativeHumidityUnit: json['relative_humidity_2m'] as String?,
      surfacePressureUnit: json['surface_pressure'] as String?,
      temperatureUnit: json['temperature_2m'] as String?,
      timeUnit: json['time'] as String?,
      windSpeedUnit: json['wind_speed_10m'] as String?,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'apparent_temperature': apparentTemperatureUnit,
      'rain': rainUnit,
      'relative_humidity_2m': relativeHumidityUnit,
      'surface_pressure': surfacePressureUnit,
      'temperature_2m': temperatureUnit,
      'time': timeUnit,
      'wind_speed_10m': windSpeedUnit,
    };
  }
}
