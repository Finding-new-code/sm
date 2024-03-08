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
  final Post lastestpost;
  const LastestPostLoaded(this.lastestpost);
  @override
  List<Object> get props => [lastestpost];
}

final class PostIsLiked extends HomeState {
  // final Post post;
  // const PostIsLiked(this.post);
  // @override
  // List<Object> get props => [post];
}
