class CurrentWeatherDto {
  final double? apparentTemperature;
  final double? interval;
  final double? rain;
  final double? relativeHumidity;
  final double? surfacePressure;
  final double? temperature;
  final String? time;
  final int? weatherCode;
  final double? windSpeed;
  final int? isDay;

  CurrentWeatherDto({
    this.apparentTemperature,
    this.interval,
    this.rain,
    this.relativeHumidity,
    this.surfacePressure,
    this.temperature,
    this.time,
    this.weatherCode,
    this.windSpeed,
    this.isDay,
  });

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDto(
      apparentTemperature: (json['apparent_temperature'] as num?)?.toDouble(),
      interval: (json['interval'] as num?)?.toDouble(),
      rain: (json['rain'] as num?)?.toDouble(),
      relativeHumidity: (json['relative_humidity_2m'] as num?)?.toDouble(),
      surfacePressure: (json['surface_pressure'] as num?)?.toDouble(),
      temperature: (json['temperature_2m'] as num?)?.toDouble(),
      time: json['time'] as String?,
      weatherCode: json['weather_code'] as int?,
      windSpeed: (json['wind_speed_10m'] as num?)?.toDouble(),
      isDay: json['is_day'] as int?,
    );
  }
}
