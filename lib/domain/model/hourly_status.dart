import 'package:weather_app/domain/model/temperature.dart';

class HourlyStatus {
  final int hour;
  final Temperature temperature;
  final int weatherCode;

  HourlyStatus({
    required this.hour,
    required this.temperature,
    required this.weatherCode,
  });
}
