import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/model/daily_weather.dart';
import 'package:weather_app/ui/theme/font_families.dart';
import '../theme/app_colors.dart';

class NextDaysWeatherForecastTable extends StatelessWidget {
  final List<DailyWeatherInfo> dailyWeatherList;

  const NextDaysWeatherForecastTable ({super.key, required this.dailyWeatherList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.dayBackground,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.dayBorder, width: 1),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,

        itemCount: dailyWeatherList.length,

        itemBuilder: (context, index) {
          return _DailyWeatherDetails(dailyWeather: dailyWeatherList[index]);
        },

        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.dayBorder,
          );
        },
      ),
    );
  }
}

class _DailyWeatherDetails extends StatelessWidget {
  final DailyWeatherInfo dailyWeather;

  const _DailyWeatherDetails({required this.dailyWeather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                dailyWeather.dayOfWeek,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontFamily: urbanist,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.dayText60,
                ),
              ),
            ),
          ),

          Expanded(
            child: Center(
              child: Image.asset(dailyWeather.iconPath, height: 32),
            ),
          ),

          Expanded(
            child: Row(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _TempDisplay(
                  icon: 'assets/images/arrow_up.svg',
                  text: '${dailyWeather.maxTemperature}°C',
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    '|',
                    style: TextStyle(
                      fontFamily: urbanist,
                      color: AppColors.daySeparator,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),

                _TempDisplay(
                  icon: 'assets/images/arrow_up.svg',
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
  final String icon;
  final String text;

  const _TempDisplay({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 12, colorFilter: ColorFilter.mode(
          AppColors.dayText87,
          BlendMode.srcIn,
        ),
        ),
        const SizedBox(width: 2.5),
        Text(
          text,
          style: TextStyle(
            fontFamily: urbanist,
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
