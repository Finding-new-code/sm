part of 'post_bloc.dart';

sealed class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostSuccess extends PostState {}

final class PostFailure extends PostState {
  final String message;

  const PostFailure(this.message);

  @override
  List<Object> get props => [message];
}
