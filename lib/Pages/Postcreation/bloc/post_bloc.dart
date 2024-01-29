import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../src/modals/post.dart';
import '../../../src/repository/databases.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final DatabasesRepository databasesRepository;
  PostBloc({required this.databasesRepository}) : super(PostInitial()) {
    on<PostSendRequested>(_postsendasrequest);
  }
  void _postsendasrequest(
      PostSendRequested event, Emitter<PostState> emit) async {
    final String text = event.text;
    final List<File> image = event.image;
    final String userid = event.userid;

    try {
      databasesRepository.postSendToServer(Post(
          createdAt: DateTime.now(),
          hashtags: const [],
          links: "",
          userid: userid,
          postid: ID.unique(),
          posttext: text,
          likes: const [],
          commentsid: const [],
          imageLinks: image.map((e) => e.path).toList()));
      return emit(PostSuccess());
    } on AppwriteException catch (e) {
      return emit(PostFailure(e.message.toString()));
    }
  }
}
