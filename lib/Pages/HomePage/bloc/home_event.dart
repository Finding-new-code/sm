part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetNewPosts extends HomeEvent {}

final class GetLastestPosts extends HomeEvent {}

final class ChangeTheme extends HomeEvent {
  final ThemeData theme;

  const ChangeTheme(this.theme);

  @override
  List<Object> get props => [theme];
}

final class UserInfo extends HomeEvent {}

final class DeletePost extends HomeEvent {
  final Post post;

  const DeletePost(this.post);

  @override
  List<Object> get props => [post];
}

final class LikeAPost extends HomeEvent {
  final Post post;

  const LikeAPost(this.post);

  @override
  List<Object> get props => [post];
}

final class UserSearched extends HomeEvent {
  final String search;

  const UserSearched(this.search);

  @override
  List<Object> get props => [search];
}

final class CommentPostedByUser extends HomeEvent {
  final String postid;
  final String comment;

  const CommentPostedByUser(this.postid, this.comment);

  @override
  List<Object> get props => [postid,comment];
}