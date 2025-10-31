import 'package:weather_app/domain/entity/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherForecast(double latitude, double longitude);
}
