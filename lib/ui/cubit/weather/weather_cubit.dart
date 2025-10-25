import 'package:bloc/bloc.dart';
import 'package:weather_app/domain/entity/weather.dart';
import 'package:weather_app/domain/model/location_coordinate.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  Future<void> getWeather({
    required LocationCoordinate locationCoordinate,
  }) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getWeatherForecast(
        locationCoordinate.latitude,
        locationCoordinate.longitude,
      );
      emit(WeatherLoaded(weather: weather));
    } catch (e) {
      emit(WeatherError(message: e.toString()));
    }
  }
}
