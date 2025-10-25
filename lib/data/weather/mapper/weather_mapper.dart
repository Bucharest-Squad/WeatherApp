import 'package:weather_app/data/weather/model/weather_dto.dart';
import 'package:weather_app/domain/entity/weather.dart';
import 'package:weather_app/domain/model/temperature.dart';
import 'package:weather_app/domain/model/current_day_weather_status.dart';
import 'package:weather_app/domain/model/hourly_status.dart';
import 'package:weather_app/domain/model/day_forecast.dart';
import 'package:weather_app/domain/model/speed.dart';
import 'package:weather_app/domain/model/atmospheric_pressure.dart';

class WeatherMapper {
  static Weather toDomain(WeatherDto dto) {
    return Weather(
      currentTemperature: _mapCurrentTemperature(dto),
      currentDayWeatherStatus: _mapCurrentDayWeatherStatus(dto),
      hourlyStatus: _mapHourlyStatus(dto),
      currentDayForecast: _mapCurrentDayForecast(dto),
      nextDaysForecast: _mapNextDaysForecast(dto),
      isDaytime: _mapIsDaytime(dto),
    );
  }

  static Temperature _mapCurrentTemperature(WeatherDto dto) {
    final temperature = dto.currentWeather?.temperature ?? 0.0;
    final unit = _parseTemperatureUnit(dto.currentUnits?.temperatureUnit);
    return Temperature(temperature: temperature, unit: unit);
  }

  static TodayWeatherStatus _mapCurrentDayWeatherStatus(WeatherDto dto) {
    final windSpeed = Speed(
      speed: dto.currentWeather?.windSpeed ?? 0.0,
      unit: _parseSpeedUnit(dto.currentUnits?.windSpeedUnit),
    );

    final feelsLike = Temperature(
      temperature: dto.currentWeather?.apparentTemperature ?? 0.0,
      unit: _parseTemperatureUnit(dto.currentUnits?.apparentTemperatureUnit),
    );

    final pressure = AtmosphericPressure(
      pressure: dto.currentWeather?.surfacePressure ?? 0.0,
      unit: _parsePressureUnit(dto.currentUnits?.surfacePressureUnit),
    );

    final uvIndex = dto.dailyWeather?.uvIndexMax?.isNotEmpty == true
        ? dto.dailyWeather!.uvIndexMax!.first
        : 0.0;

    return TodayWeatherStatus(
      windSpeed: windSpeed,
      humidity: dto.currentWeather?.relativeHumidity ?? 0.0,
      rain: dto.currentWeather?.rain ?? 0.0,
      uvIndex: uvIndex,
      pressure: pressure,
      feelsLike: feelsLike,
    );
  }

  static List<HourlyStatus> _mapHourlyStatus(WeatherDto dto) {
    final hourly = dto.hourly;
    if (hourly?.time == null ||
        hourly?.temperature == null ||
        hourly?.weatherCode == null) {
      return [];
    }

    final List<HourlyStatus> hourlyStatuses = [];
    final timeList = hourly!.time!;
    final tempList = hourly.temperature!;
    final codeList = hourly.weatherCode!;

    final maxLength = [
      timeList.length,
      tempList.length,
      codeList.length,
    ].reduce((a, b) => a < b ? a : b);

    for (int i = 0; i < maxLength; i++) {
      final timeString = timeList[i];
      final hour = DateTime.parse(timeString).hour;

      final temperature = Temperature(
        temperature: tempList[i],
        unit: _parseTemperatureUnit(dto.currentUnits?.temperatureUnit),
      );

      hourlyStatuses.add(
        HourlyStatus(
          hour: hour,
          temperature: temperature,
          weatherCode: codeList[i],
        ),
      );
    }

    return hourlyStatuses;
  }

  static DayForecast _mapCurrentDayForecast(WeatherDto dto) {
    final daily = dto.dailyWeather;
    if (daily?.temperatureMin == null ||
        daily?.temperatureMax == null ||
        daily?.weatherCode == null) {
      return DayForecast(
        minTemperature: Temperature(
          temperature: 0.0,
          unit: TemperatureUnit.celecus,
        ),
        maxTemperature: Temperature(
          temperature: 0.0,
          unit: TemperatureUnit.celecus,
        ),
        weatherConditionCode: 0,
      );
    }

    final tempUnit = _parseTemperatureUnit(dto.currentUnits?.temperatureUnit);

    return DayForecast(
      minTemperature: Temperature(
        temperature: daily!.temperatureMin!.first,
        unit: tempUnit,
      ),
      maxTemperature: Temperature(
        temperature: daily.temperatureMax!.first,
        unit: tempUnit,
      ),
      weatherConditionCode: daily.weatherCode!.first,
    );
  }

  static List<DayForecast> _mapNextDaysForecast(WeatherDto dto) {
    final daily = dto.dailyWeather;
    if (daily?.temperatureMin == null ||
        daily?.temperatureMax == null ||
        daily?.weatherCode == null) {
      return [];
    }

    final List<DayForecast> forecasts = [];
    final minTempList = daily!.temperatureMin!;
    final maxTempList = daily.temperatureMax!;
    final codeList = daily.weatherCode!;
    final tempUnit = _parseTemperatureUnit(dto.currentUnits?.temperatureUnit);

    final maxLength = [
      minTempList.length,
      maxTempList.length,
      codeList.length,
    ].reduce((a, b) => a < b ? a : b);

    // Skip the first day (current day) and get the next days
    for (int i = 1; i < maxLength; i++) {
      forecasts.add(
        DayForecast(
          minTemperature: Temperature(
            temperature: minTempList[i],
            unit: tempUnit,
          ),
          maxTemperature: Temperature(
            temperature: maxTempList[i],
            unit: tempUnit,
          ),
          weatherConditionCode: codeList[i],
        ),
      );
    }

    return forecasts;
  }

  static bool _mapIsDaytime(WeatherDto dto) {
    return dto.currentWeather?.isDay == 1;
  }

  static TemperatureUnit _parseTemperatureUnit(String? unit) {
    switch (unit?.toLowerCase()) {
      case '°f':
      case 'fahrenheit':
        return TemperatureUnit.fehrenhite;
      case '°c':
      case 'celsius':
      default:
        return TemperatureUnit.celecus;
    }
  }

  static SpeedUnit _parseSpeedUnit(String? unit) {
    switch (unit?.toLowerCase()) {
      case 'mph':
      case 'mi/h':
        return SpeedUnit.mph;
      case 'km/h':
      case 'kmph':
      default:
        return SpeedUnit.kmph;
    }
  }

  static AtmosphericPressureUnit _parsePressureUnit(String? unit) {
    switch (unit?.toLowerCase()) {
      case 'hpa':
        return AtmosphericPressureUnit.hPa;
      case 'kpa':
        return AtmosphericPressureUnit.kPa;
      case 'mbar':
        return AtmosphericPressureUnit.mbar;
      case 'atm':
        return AtmosphericPressureUnit.atm;
      case 'psi':
        return AtmosphericPressureUnit.psi;
      case 'mmhg':
        return AtmosphericPressureUnit.mmHg;
      case 'inhg':
        return AtmosphericPressureUnit.inHg;
      case 'pa':
      default:
        return AtmosphericPressureUnit.pa;
    }
  }
}
