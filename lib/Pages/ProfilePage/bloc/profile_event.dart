part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

final class GetUserData extends ProfileEvent {}

final class FetchCurrentUserData extends ProfileEvent {}

final class FollowUser extends ProfileEvent {
  final UserModel user;

  const FollowUser(this.user);

  @override
  List<Object> get props => [user];
}
