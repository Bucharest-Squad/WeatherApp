import 'package:bloc/bloc.dart';
import '../../theme/app_theme.dart';
import '../../theme/app_theme_day.dart';

class ThemeCubit extends Cubit<AppTheme> {
  final AppTheme _dayTheme;
  final AppTheme _nightTheme;
  ThemeCubit(this._dayTheme, this._nightTheme) : super(DayTheme());

  void updateTheme(bool isDayTime) {
    AppTheme newTheme = isDayTime ? _dayTheme : _nightTheme;
    emit(newTheme);
  }
}
