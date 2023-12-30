import 'package:flutter/material.dart';
import 'package:myapp/src/auth.dart';

import '../../../constants/tools.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
 // final Account account;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
      on<AsAuthRequest>((event, emit) {
        emit(AuthLoading());
        final String name = event.name;
        final String password = event.password;
        final String email = event.email;
        final bool isnew = event.isnew;

        // if (isnew == true) {
        //   Auth(account: account);
        // }
      });
    });
  }
}
