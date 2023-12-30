part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}
final class AsAuthRequest extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final bool isnew;
  AsAuthRequest({required this.email,required this.password,required this.name, required this.isnew});
}