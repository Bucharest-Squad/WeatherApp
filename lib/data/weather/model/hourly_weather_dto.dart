class HourlyWeatherDto {
  final List<double>? temperature;
  final List<String>? time;
  final List<int>? weatherCode;

  HourlyWeatherDto({
    this.temperature,
    this.time,
    this.weatherCode,
  });

  factory HourlyWeatherDto.fromJson(Map<String, dynamic> json) {
    return HourlyWeatherDto(
      temperature: (json['temperature_2m'] as List?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      time: (json['time'] as List?)
          ?.map((e) => e as String)
          .toList(),
      weatherCode: (json['weather_code'] as List?)
          ?.map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature_2m': temperature,
      'time': time,
      'weather_code': weatherCode,
    };
  }
}
