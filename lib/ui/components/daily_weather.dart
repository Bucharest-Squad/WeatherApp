import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/ui/model/daily_weather.dart';
import '../../gen/assets.gen.dart';
import '../cubit/theme/theme_cubit.dart';

class NextDaysWeatherForecastTable extends StatelessWidget {
  final List<DailyWeatherInfo> dailyWeatherList;

  const NextDaysWeatherForecastTable({
    super.key,
    required this.dailyWeatherList,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeCubit>().state;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.background,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.colors.border, width: 1),
      ),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,

        itemCount: dailyWeatherList.length,

        itemBuilder: (context, index) {
          return _DailyWeatherDetails(dailyWeather: dailyWeatherList[index]);
        },

        separatorBuilder: (context, index) {
          return Divider(height: 1, thickness: 1, color: theme.colors.border);
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
    final theme = context.watch<ThemeCubit>().state;
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
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: theme.colors.text60,
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
                  icon: Assets.images.arrowUp.path,
                  text: '${dailyWeather.maxTemperature}°C',
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    '|',
                    style: TextStyle(
                      color: theme.colors.backgroundStart.withAlpha(14),
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),

                _TempDisplay(
                  icon: Assets.images.arrowDown.path,
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
    final theme = context.watch<ThemeCubit>().state;
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 12,
          colorFilter: ColorFilter.mode(theme.colors.text87, BlendMode.srcIn),
        ),
        const SizedBox(width: 2.5),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: theme.colors.text87,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
        ),
      ],
    );
  }
}
