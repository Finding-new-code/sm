part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class GetNewPosts extends HomeEvent {}

final class RefreshPosts extends HomeEvent {}

final class ChangeTheme extends HomeEvent {}

final class UserInfo extends HomeEvent {}