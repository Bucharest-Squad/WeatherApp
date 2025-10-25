import 'package:dio/dio.dart';
import 'package:weather_app/data/location/mapper/location_mapper.dart';
import 'package:weather_app/data/location/model/location_dto.dart';
import 'package:weather_app/domain/entity/location.dart';

import '../../../domain/repository/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  final Dio dio;

  LocationRepositoryImpl(this.dio);

  @override
  Future<Location> getCurrentLocation() async {
    try {
      final response = await dio.get(
        "http://ip-api.com/json",
        queryParameters: {
          'fields':
              'status,message,country,countryCode,region,regionName,city,zip,lat,lon,timezone,isp,org,as,query',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return LocationMapper.toDomain(
          await LocationDto.fromJson(response.data),
        );
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
