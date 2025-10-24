import 'package:dio/dio.dart';
import 'package:weather_app/data/weather/model/location_dto.dart';
import 'package:weather_app/data/weather/repository/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  final Dio dio;

  LocationRepositoryImpl(this.dio);

  @override
  Future<LocationDto> getLocation() async {
    try {
      final response = await dio.get(
        "http://ip-api.com/json/",
        queryParameters: {
          'fields':
              'status,message,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,org,as,query',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return LocationDto.fromJson(response.data);
      } else {
        throw Exception(
          'Failed to fetch location. Status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch location: ${e.message}');
    }
  }
}
