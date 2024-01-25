part of 'theme_bloc.dart';

enum AppTheme2 { light, dark }

class ThemeState extends Equatable {
  final AppTheme2 appTheme;

  ThemeState({this.appTheme = AppTheme2.light});

  factory ThemeState.initial() {
    return ThemeState(appTheme: AppTheme2.light);
  }

  @override
  List<Object> get props => [appTheme];

  @override
  String toString() => 'ThemeState(appTheme: $appTheme)';

  ThemeState copyWith({AppTheme2? appTheme}) {
    return ThemeState(appTheme: appTheme ?? this.appTheme);
  }
}
