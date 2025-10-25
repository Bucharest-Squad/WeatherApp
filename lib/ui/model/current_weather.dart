class CurrentWeather {
  final String image;
  final String temperature;
  final String status;
  final String highTemp;
  final String lowTemp;
  final String unit;

  const CurrentWeather({
    required this.image,
    required this.temperature,
    required this.status,
    required this.highTemp,
    required this.lowTemp,
    this.unit = '°C',
  });

  factory CurrentWeather.sample() {
    return const CurrentWeather(
      image: 'assets/images/day_mainly_clear.png',
      temperature: '24',
      status: 'Partly cloudy',
      highTemp: '32',
      lowTemp: '20',
      unit: '°C',
    );
  }

  CurrentWeather copyWith({
    String? image,
    String? temperature,
    String? status,
    String? highTemp,
    String? lowTemp,
    String? unit,
  }) {
    return CurrentWeather(
      image: image ?? this.image,
      temperature: temperature ?? this.temperature,
      status: status ?? this.status,
      highTemp: highTemp ?? this.highTemp,
      lowTemp: lowTemp ?? this.lowTemp,
      unit: unit ?? this.unit,
    );
  }
}