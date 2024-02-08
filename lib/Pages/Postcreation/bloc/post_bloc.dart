import 'dart:io';
import 'package:equatable/equatable.dart';
import '../../../constants/tools.dart';
import '../../../src/extract.dart';
import '../../../src/modals/post.dart';
import '../../../src/repository/databases.dart';
import '../../../src/repository/storage.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final DatabasesRepository databasesRepository;
  final StorageRepository storageRespository;
  PostBloc(
      {required this.databasesRepository, required this.storageRespository})
      : super(PostInitial()) {
    on<PostSendRequested>(_postsendasrequest);
  }
  void _postsendasrequest(
      PostSendRequested event, Emitter<PostState> emit) async {
    final String text = event.text;
    final List<File> image = event.image;
    //final String userid = event.userid;

    try {
      final prefes = await SharedPreferences.getInstance();
      final userid = prefes.getString('userId');
      final hashtags = getHastags(text);
      String links = linksfromtext(text);
      final imagelinks = await storageRespository.uploadFile(image);
      print(imagelinks.toList());
      await databasesRepository.postSendToServer(Post(
          createdAt: DateTime.now(),
          hashtags: hashtags,
          links: links,
          userid: userid.toString(),
          postid: ID.unique(),
          posttext: text,
          likes: const [],
          commentsid: const [],
          imageLinks: imagelinks));
      return emit(PostSuccess());
    } on AppwriteException catch (e) {
      return emit(PostFailure(e.message.toString()));
    }
  }
}
