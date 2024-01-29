part of 'settings_bloc.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();
  
  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class SettingsLoading extends SettingsState {}

final class SettingsError extends SettingsState {
  final String message;
  const SettingsError(this.message);
}

// filename: settings_event.dart