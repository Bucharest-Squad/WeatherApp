import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/location/repository/location_repository_impl.dart';
import 'package:weather_app/data/weather/repository/weather_repository_impl.dart';
import 'package:weather_app/domain/repository/location_repository.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';
import 'package:weather_app/ui/cubit/location/location_cubit.dart';
import 'package:weather_app/ui/cubit/theme/theme_cubit.dart';
import 'package:weather_app/ui/cubit/weather/weather_cubit.dart';
import 'package:weather_app/ui/theme/app_theme_day.dart';
import 'package:weather_app/ui/theme/app_theme_night.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  _setupTheme();
  _setupNetworkClient();
  _setupRepository();
  _setupCubit();
}

void _setupTheme() {
  getIt.registerSingleton<DayTheme>(DayTheme());
  getIt.registerSingleton<NightTheme>(NightTheme());
}

void _setupRepository() {
  getIt.registerSingleton<LocationRepository>(LocationRepositoryImpl(getIt()));
  getIt.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(getIt()));
}

void _setupNetworkClient() {
  getIt.registerSingleton<Dio>(Dio());
}

void _setupCubit() {
  getIt.registerSingleton(ThemeCubit(getIt<DayTheme>(), getIt<NightTheme>()));
  getIt.registerFactory( () => LocationCubit(locationRepository: getIt()));
  getIt.registerFactory( () => WeatherCubit(weatherRepository: getIt()));
}