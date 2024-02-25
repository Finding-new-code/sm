part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}


final class HomeLoaded extends HomeState {
  final List<Post> posts;
   final List<UserModel> users;
   const HomeLoaded({required this.posts, required this.users});
  @override
  List<Object> get props => [posts, users];
}

final class HomeError extends HomeState {
  final String message;
  const HomeError({required this.message});
  @override
  List<Object> get props => [message];
}

final class LastestPostLoaded extends HomeState {
  final Stream<RealtimeMessage> posts;
  const LastestPostLoaded(this.posts);
  @override
  List<Object> get props => [posts];
}
