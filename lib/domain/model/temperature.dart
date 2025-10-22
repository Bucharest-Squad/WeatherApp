class Temperature {
  final double temperature;
  final TemperatureUnit unit;

  Temperature({required this.temperature, required this.unit});
}

enum TemperatureUnit {
  fehrenhite,
  celecus
}