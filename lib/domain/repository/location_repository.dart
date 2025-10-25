import 'package:weather_app/domain/entity/location.dart';

abstract interface class LocationRepository {
   Future<Location> getCurrentLocation();
}