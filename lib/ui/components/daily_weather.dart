import 'package:flutter/material.dart';
import 'package:weather_app/ui/model/daily_weather.dart';
import '../theme/app_colors.dart';

class WeaklyWeatherForecastPage extends StatelessWidget {
  final List<DailyWeatherInfo> dailyWeatherList;
  const WeaklyWeatherForecastPage({super.key, required this.dailyWeatherList});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: const BorderSide(color: AppColors.dayBorder, width: 1),
        ),
         clipBehavior: Clip.antiAlias,
      child: Container(
        color: AppColors.dayBackground,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,

          itemCount: dailyWeatherList.length,

          itemBuilder: (context, index) {
            return DailyWeatherDetails(dailyWeather: dailyWeatherList[index]);
          },

          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.dayBorder,
            );
          },
        ),
      ),
    );
  }
}

class DailyWeatherDetails extends StatelessWidget {
  final DailyWeatherInfo dailyWeather;

  const DailyWeatherDetails({super.key, required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    child:  Row(
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              dailyWeather.dayOfWeek,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.dayText60,
              ),
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: Image.asset(dailyWeather.iconPath, width: 32, height: 32),
          ),
        ),

        Expanded(
          child: Row(

            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _TempDisplay(
                icon: Icons.arrow_upward,
                text: '${dailyWeather.maxTemperature}°C',
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '|',
                  style: TextStyle(
                    color: AppColors.daySeparator,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),

              _TempDisplay(
                icon: Icons.arrow_downward,
                text: '${dailyWeather.minTemperature}°C',
              ),

            ],
          ),
        ),
      ],
    ),
    );
  }
}

class _TempDisplay extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TempDisplay({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 12, color: AppColors.dayText87),
        const SizedBox(width: 2.5),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.dayText87,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
        ),
      ],
    );
  }
}
