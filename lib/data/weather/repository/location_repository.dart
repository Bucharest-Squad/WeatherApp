import 'package:weather_app/data/weather/model/location_dto.dart';

abstract class LocationRepository {
  Future<LocationDto> getLocation();
}