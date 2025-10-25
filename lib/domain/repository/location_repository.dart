import 'package:weather_app/domain/entity/location.dart';

abstract class LocationRepository {
  Future<Location> getCurrentLocation();
}
