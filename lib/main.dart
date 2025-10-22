import 'package:flutter/material.dart';
import 'package:weather_app/ui/screen/weather_screen.dart';
import 'di/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(),
      home: const WeatherScreen(),
    );
  }
}
