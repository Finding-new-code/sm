part of 'theme_cubit.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

final class ThemeInitial extends ThemeState {}

final class DarkModeActivated extends ThemeState {
  const DarkModeActivated();

  @override
  List<Object> get props => [];
}

final class LightModeActivated extends ThemeState {
  const LightModeActivated();

  @override
  List<Object> get props => [];
}

final class SystemModeActivated extends ThemeState {
  const SystemModeActivated() : super();

  @override
  List<Object> get props => [];
}