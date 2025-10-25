import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/current_weather_card.dart';
import '../cubit/theme/theme_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;

    return Theme(
      data: theme.themeData,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: theme.colors.backgroundGradient,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 12.0),
              child: Column(
                children: [
                  const CurrentWeatherCard(
                  ),

                  const SizedBox(height: 24),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}