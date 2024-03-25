part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

final class DarkModeActivated extends ThemeState {
  final ThemeMode themeMode;
  const DarkModeActivated({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

final class LightModeActivated extends ThemeState {
  final ThemeMode themeMode;
  const LightModeActivated({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

final class SystemModeActivated extends ThemeState {
  final ThemeMode themeMode;
  const SystemModeActivated({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}
