part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeStateCubit extends Equatable {
  final AppTheme appTheme;

  ThemeStateCubit({this.appTheme = AppTheme.light});

  factory ThemeStateCubit.initial() {
    return ThemeStateCubit(appTheme: AppTheme.light);
  }

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeStateCubit(appTheme: $appTheme)';

  ThemeStateCubit copyWith({AppTheme? appTheme}) {
    return ThemeStateCubit(appTheme: appTheme ?? this.appTheme);
  }
}
