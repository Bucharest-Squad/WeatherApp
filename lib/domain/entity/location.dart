import '../model/location_coordinate.dart';

class Location {
  final double latitude;
  final double longitude;
  final String country;
  final String city;

  Location({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
  });
}
