class LocationDto {
  final double latitude;
  final double longitude;
  final String country;
  final String city;

  LocationDto({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
  });

  static Future<LocationDto> fromJson(Map<String, dynamic> json) async {
    return LocationDto(
      latitude: (json['lat'])?.toDouble(),
      longitude: (json['lon'])?.toDouble(),
      country: (json['country']),
      city: (json['city']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'city': city,
    };
  }
}
