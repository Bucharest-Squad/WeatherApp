import 'package:get_it/get_it.dart';

import '../ui/cubit/theme/theme_cubit.dart';
import '../ui/theme/app_theme_day.dart';
import '../ui/theme/app_theme_night.dart';

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

}

void _setupNetworkClient() {

}

void _setupCubit() {
  getIt.registerSingleton(ThemeCubit(getIt<DayTheme>(), getIt<NightTheme>()));
}