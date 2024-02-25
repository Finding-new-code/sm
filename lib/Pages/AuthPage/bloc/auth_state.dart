part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {

}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
    @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
final class AuthSuccess extends AuthState {
  String? user;
  AuthSuccess(this.user);
    @override
  List<Object> get props => [user.toString()];
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
    @override
  List<Object> get props => [message];

}

final class AuthLogoutSuccess extends AuthState {
    @override
  List<Object> get props => [];
}

final class AccountVerificationSuccess extends AuthState {
    @override
  List<Object> get props => [];
}


