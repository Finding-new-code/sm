import 'package:flutter/material.dart';
import '../../../constants/tools.dart';
import '../../../src/auth.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Account account;
  AuthBloc(this.account) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
      on<AsAuthRequest>((event, emit) async {
        emit(AuthLoading());
        final String name = event.name;
        final String password = event.password;
        final String email = event.email;
        final bool isnew = event.isnew;

        try {
          if (isnew == true) {
            final response =
                Auth(account: account).createAccount(email, password, name);
            debugPrint(response.toString());
            return emit(AuthSuccess());
          } else {
            final response = Auth(account: account).loginAccount(name, password);
            debugPrint(response.toString());
            return emit(AuthSuccess());
          }
        } on AppwriteException catch (e) {
          debugPrint("${e.code} ${e.message} ${e.response}");
          return emit(AuthFailure(e.message.toString()));
        }
      });
    });
  }
}
