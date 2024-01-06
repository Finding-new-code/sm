import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/src/auth.dart';
import '../../../constants/tools.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    /// here you can place you event haldlers =>
    on<AsAuthRequest>(_asauthrequest);
  }
  /// here the event handlers function body for better code readibility =>
  void _asauthrequest(AsAuthRequest event, Emitter<AuthState> emit) async {
      try {
      final String name = event.name;
      final String password = event.password;
      final String email = event.email;
      final bool isnew = event.isnew;
      if (email.isEmpty || password.isEmpty) {
          return emit(AuthFailure( "Email or password is empty"));
        }
        if (email.isEmpty) {
          return emit(AuthFailure( "Email is empty"));
        }
        if (password.isEmpty) {
          return emit(AuthFailure( "Password is empty"));
        }
        if (password.length < 8) {
          return emit(AuthFailure( "Password is too short"));
        }
        if (password.length > 32) {
          return emit(AuthFailure( "Password is too long"));
        } 
        if (!email.contains("@")) {
          return emit(AuthFailure( "Email is not valid"));
        }
      emit(AuthLoading());
        if (isnew == true) {
          authRepository.createAccount(email, password, name);
          return emit(AuthSuccess());
        } else {
          authRepository.loginAccount(email, password);
          return emit(AuthSuccess());
        }
      } on AppwriteException catch (e) {
        return emit(AuthFailure(e.message.toString()));
      }
    }
}
