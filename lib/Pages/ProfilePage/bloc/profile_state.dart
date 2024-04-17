part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final UserModel profile;
  //final List<Post> posts;
  const ProfileLoaded(this.profile);

  @override
  List<Object> get props => [profile];
}

final class ProfileError extends ProfileState {
  final String message;
  const ProfileError(this.message);

  @override
  List<Object> get props => [message];
}

// final class ProfileUpdated extends ProfileState {
//   final UserModel profile;
//   const ProfileUpdated(this.profile);

//   @override
//   List<Object> get props => [profile];
// }

final class Userfollowed extends ProfileState {}

final class UserUnfollowed extends ProfileState {}

final class FetchUserFolloewer extends ProfileState {}
