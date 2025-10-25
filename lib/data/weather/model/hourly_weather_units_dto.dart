class HourlyWeatherUnitsDto {
  final String? temperatureUnit;
  final String? timeUnit;

  HourlyWeatherUnitsDto({
    this.temperatureUnit,
    this.timeUnit,
  });

  factory HourlyWeatherUnitsDto.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherUnitsDto(
      temperatureUnit: json['temperature_2m'] as String?,
      timeUnit: json['time'] as String?,
    );
  }
}
