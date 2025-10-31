import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/service_locator.dart';
import 'package:weather_app/domain/entity/weather.dart';
import 'package:weather_app/domain/model/location_coordinate.dart';
import 'package:weather_app/ui/cubit/location/location_cubit.dart';
import 'package:weather_app/ui/cubit/weather/weather_cubit.dart';

import '../components/current_weather_card.dart';
import '../components/location_row.dart';
import '../components/weather_details.dart';
import '../cubit/theme/theme_cubit.dart';
import '../model/current_weather.dart';
import '../model/weather_info.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<LocationCubit>()..getLocation(),
        ),
        BlocProvider(create: (context) => getIt<WeatherCubit>()),
      ],
      child: Container(
        decoration: BoxDecoration(gradient: theme.colors.backgroundGradient),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocListener<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is LocationLoaded) {
                context.read<WeatherCubit>().getWeather(
                  locationCoordinate: LocationCoordinate(
                    latitude: state.location.latitude,
                    longitude: state.location.longitude,
                  ),
                );
              }
            },
            child: BlocConsumer<WeatherCubit, WeatherState>(
              listener: (context, state) {
                if (state is WeatherLoaded) {
                  context.read<ThemeCubit>().updateTheme(
                    state.weather.isDaytime,
                  );
                }
              },
              builder: (context, state) {
                return switch (state) {
                  WeatherInitial() => _CustomLoading(),
                  WeatherLoading() => _CustomLoading(),
                  WeatherLoaded() => _WeatherScreenContent(
                    weather: state.weather,
                  ),
                  WeatherError() => _CustomLoading(),
                };
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomLoading extends StatelessWidget {
  const _CustomLoading();

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class _WeatherScreenContent extends StatelessWidget {
  final Weather weather;

  const _WeatherScreenContent({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 12.0,
        right: 12.0,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: LocationRow(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CurrentWeatherCard(
                currentWeather: CurrentWeather.sample(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: WeatherDetails(
              weatherInfo: [
                WeatherInfo(
                  iconPath: 'assets/images/fast_wind.svg',
                  value:
                      '${weather.currentDayWeatherStatus.windSpeed.speed.round()} ${weather.currentDayWeatherStatus.windSpeed.unit.name}',
                  label: 'Wind',
                ),
                WeatherInfo(
                  iconPath: 'assets/images/humidity.svg',
                  value: '${weather.currentDayWeatherStatus.humidity.round()}%',
                  label: 'Humidity',
                ),
                WeatherInfo(
                  iconPath: 'assets/images/rain.svg',
                  value: '${weather.currentDayWeatherStatus.rain.round()}%',
                  label: 'Rain',
                ),
                WeatherInfo(
                  iconPath: 'assets/images/uv.svg',
                  value: '${weather.currentDayWeatherStatus.uvIndex.round()}',
                  label: 'UV Index',
                ),
                WeatherInfo(
                  iconPath: 'assets/images/pressure.svg',
                  value:
                      '${weather.currentDayWeatherStatus.pressure.pressure.round()} ${weather.currentDayWeatherStatus.pressure.unit.name}',
                  label: 'Pressure',
                ),
                WeatherInfo(
                  iconPath: 'assets/images/temperature.svg',
                  value:
                      '${weather.currentDayWeatherStatus.feelsLike.temperature.round()} ${weather.currentDayWeatherStatus.feelsLike.unit.name}',
                  label: 'Feels Like',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
