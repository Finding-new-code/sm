part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

final class PostSendRequested extends PostEvent {
  final String text;
  final List<File> image;
 // final String userid;
  const PostSendRequested({required this.text, required this.image,});
  @override
  List<Object> get props => [text, image,];
}
