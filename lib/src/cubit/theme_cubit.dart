
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const DarkModeActivated());
 
 void toggleTheme(ThemeMode theme) {
  if (theme == ThemeMode.dark) {
    emit(const DarkModeActivated());
  } else {
    emit(const LightModeActivated());
  }
}
}

