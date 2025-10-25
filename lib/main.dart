import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/cubit/theme/theme_cubit.dart';
import 'package:weather_app/ui/screen/weather_screen.dart';
import 'package:weather_app/ui/theme/app_theme.dart';
import 'di/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: state.themeData,
            home: const WeatherScreen(),
          );
        },
      ),
    );
  }
}
