import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/glassmorphism_container.dart';
import 'max_min_temp_card.dart';
import '../cubit/theme/theme_cubit.dart';
import 'package:weather_app/ui/theme/font_families.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});

  final String location = 'Baghdad';
  final String temperature = '24';
  final String unit = '°C';
  final String description = 'Snow';
  final String highTemp = '32';
  final String lowTemp = '20';

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;
    final iconColor = (theme.brightness == Brightness.light)
        ? const Color.fromARGB(255, 12, 57, 133)
        : theme.colors.onPrimary;

    return GlassmorphismContainer(
      width: 350,
      height: 550,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on, size: 24, color: theme.colors.text87),
                const SizedBox(width: 8),
                Text(
                  location,
                  style: TextStyle(
                      fontFamily: urbanist,
                      fontSize: 22, fontWeight: FontWeight.bold, color: theme.colors.text87),
                ),
              ],
            ),

            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: theme.colors.primary.withOpacity(0.4),
                      blurRadius: 150.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0, 0),
                      blurStyle: BlurStyle.normal
                  ),
                ],
              ),
              child: Icon(
                Icons.ac_unit,
                size: 150,
                color: iconColor,
              ),
            ),

            Text(
              '$temperature$unit',
              style: TextStyle(
                fontFamily: urbanist,
                fontSize: 90,
                fontWeight: FontWeight.w200,
                color: theme.colors.text,
              ),
            ),

            Text(
              description,
              style: TextStyle(
                fontFamily: urbanist,
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: theme.colors.text60,
              ),
            ),

            Divider(color: theme.colors.border, thickness: 1.0, indent: 40, endIndent: 40),

            MaxMinTempCard(highTemp: highTemp, lowTemp: lowTemp, unit: unit),
          ],
        ),
      ),
    );
  }
}