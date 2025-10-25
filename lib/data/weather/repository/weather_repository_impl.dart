import 'package:dio/dio.dart';
import 'package:weather_app/data/weather/mapper/weather_mapper.dart';
import 'package:weather_app/data/weather/model/weather_dto.dart';
import 'package:weather_app/domain/entity/weather.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

const String openMeteoApi = 'https://api.open-meteo.com/v1/forecast';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio dio;

  WeatherRepositoryImpl(this.dio);

  @override
  Future<Weather> getWeatherForecast(double latitude, double longitude) async {
    try {
      final response = await dio.get(
        openMeteoApi,
        queryParameters: {
          'latitude': latitude,
          'longitude': longitude,
          'daily':
              'temperature_2m_max,temperature_2m_min,uv_index_max,weather_code',
          'hourly': 'temperature_2m,weather_code',
          'current':
              'weather_code,relative_humidity_2m,wind_speed_10m,rain,surface_pressure,apparent_temperature,temperature_2m,is_day',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return WeatherMapper.toDomain(WeatherDto.fromJson(response.data));
      } else {
        throw Exception(
          'Failed to fetch weather data. Status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Failed to fetch weather data: ${e.message}');
    }
  }
}
