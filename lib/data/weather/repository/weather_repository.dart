import 'package:weather_app/data/weather/model/weather_dto.dart';

abstract class WeatherRepository {
  Future<WeatherDto> getWeather(double latitude, double longitude);
}