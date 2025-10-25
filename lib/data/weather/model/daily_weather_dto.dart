class DailyWeatherDto {
  final List<double>? temperatureMax;
  final List<double>? temperatureMin;
  final List<String>? time;
  final List<double>? uvIndexMax;
  final List<int>? weatherCode;

  DailyWeatherDto({
    this.temperatureMax,
    this.temperatureMin,
    this.time,
    this.uvIndexMax,
    this.weatherCode,
  });

  factory DailyWeatherDto.fromJson(Map<String, dynamic> json) {
    return DailyWeatherDto(
      temperatureMax: (json['temperature_2m_max'] as List?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      temperatureMin: (json['temperature_2m_min'] as List?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      time: (json['time'] as List?)?.map((e) => e as String).toList(),
      uvIndexMax: (json['uv_index_max'] as List?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      weatherCode:
      (json['weather_code'] as List?)?.map((e) => e as int).toList(),
    );
  }
}
