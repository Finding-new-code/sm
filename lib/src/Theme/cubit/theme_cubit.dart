
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.dark);
 
 void darkMode() {emit(const DarkModeActivated(themeMode: ThemeMode.dark) as ThemeMode);} 
 void lightMode() => emit(ThemeMode.light);
 void systemMode() => emit(ThemeMode.system);
}



