import 'package:weather_app/domain/entity/weather.dart';
import '../model/location_coordinate.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherForecast(LocationCoordinate locationCoordinate);
}
