import 'package:weather_app/data/location/model/location_dto.dart';
import 'package:weather_app/domain/entity/location.dart';

class LocationMapper {
  static Location toDomain(LocationDto dto) {
    return Location(
      latitude: dto.latitude,
      longitude: dto.longitude,
      country: dto.country,
      city: dto.city,
      coordinate: null,
      cityName: '',
    );
  }
}
