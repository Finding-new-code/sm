import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:myapp658d7b3746ed317621f8/src/cache.dart';
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
    if (text.isEmpty && image.isEmpty) {
      return null;
    }
    try {
      try {
        final String userid = await Caches().get('userId');
        emit(const PostSending(true));
        final imagelinks = await storageRespository.uploadFile(image);
        String links = linksfromtext(text);
        final hashtags = getHastags(text);
        Post post = Post(
            createdAt: DateTime.now(),
            hashtags: hashtags,
            links: links,
            userid: userid,
            postid: '',
            posttext: text,
            likes: const [],
            // comments: const [],
            imageLinks: imagelinks,
            repliedTo: ''
            );

        await databasesRepository.postSendToServer(post);
        return emit(PostSuccess());
      } on Exception catch (e) {
        return emit(PostFailure(e.toString()));
      }
    } on AppwriteException catch (e) {
      return emit(PostFailure(e.message.toString()));
    }
  }
}
