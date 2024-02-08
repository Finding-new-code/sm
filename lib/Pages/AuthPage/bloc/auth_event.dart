part of 'auth_bloc.dart';


sealed class AuthEvent  {

}
final class AsAuthRequest extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final bool isnew;
  AsAuthRequest({required this.email,required this.password,required this.name, required this.isnew});
  
   
}

final class RecoveryPassword extends AuthEvent{
  final String email;
  RecoveryPassword({required this.email});
}

final class Logout extends AuthEvent{
  Logout();
}

final class AccountVerification extends AuthEvent{
  
}
