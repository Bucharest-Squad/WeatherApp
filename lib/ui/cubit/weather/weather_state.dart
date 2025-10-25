part of 'weather_cubit.dart';

sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({required this.weather});
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError({required this.message});
}