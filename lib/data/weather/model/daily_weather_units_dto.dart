class DailyWeatherUnitsDto {
  final String? temperatureMaxUnit;
  final String? temperatureMinUnit;
  final String? timeUnit;
  final String? uvIndexUnit;

  DailyWeatherUnitsDto({
    this.temperatureMaxUnit,
    this.temperatureMinUnit,
    this.timeUnit,
    this.uvIndexUnit,
  });

  factory DailyWeatherUnitsDto.fromJson(Map<String, dynamic> json) {
    return DailyWeatherUnitsDto(
      temperatureMaxUnit: json['temperature_2m_max'] as String?,
      temperatureMinUnit: json['temperature_2m_min'] as String?,
      timeUnit: json['time'] as String?,
      uvIndexUnit: json['uv_index_max'] as String?,
    );
  }
}
