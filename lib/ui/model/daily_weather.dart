class DailyWeatherInfo {
  final String iconPath;
  final int maxTemperature;
  final int minTemperature;
  final String dayOfWeek;

  const DailyWeatherInfo({
    required this.iconPath,
    required this.maxTemperature,
    required this.minTemperature,
    required this.dayOfWeek,
  });
}