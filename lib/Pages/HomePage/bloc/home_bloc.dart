import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../constants/appwriteconstants.dart';
import '../../../constants/tools.dart';
import 'package:async/async.dart' show AsyncMemoizer;
import 'dart:async';
import '../../../src/src.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabasesRepository databasesrepository;
  final StorageRepository storagerepository;
  StreamSubscription? _subscription;
  HomeBloc({required this.databasesrepository, required this.storagerepository})
      : super(HomeInitial()) {
    on<GetNewPosts>(_getNewPosts);
    on<ChangeTheme>(_changeTheme);
    on<GetLastestPosts>(_getlastestpost);
    on<DeletePost>(_deletePost);
    on<LikeAPost>(_likeAPost);
    on<UserSearched>(_usersearched);
    on<CommentPostedByUser>(_commentPostedbyUser);
  }

  void _getNewPosts(GetNewPosts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final _fetch = AsyncMemoizer<List<Post>>();
      Future<List<Post>> getPosts() async {
        final fetch = _fetch.runOnce(() async {
          final post = await databasesrepository.getPosts();

          return post.map((e) => Post.fromMap(e.data)).toList();
        });

        return fetch;
      }

      List<Post> p = await getPosts();
      // LocalDatabase().uploadPostsTolocaldb(p);

      Future<List<UserModel>> getuseraspost() async {
        List<UserModel> userinfo = [];
        for (String id in p.map((e) => e.userid)) {
          final info = await databasesrepository.getcurrentUserDetails(id);
          debugPrint(info.toString());
          userinfo.add(UserModel.fromMap(info.data));
        }

        return userinfo;
      }

      debugPrint('here the data of user from the post id ${p.toList()}');
      List<UserModel> u = await getuseraspost();
      // LocalDatabase().uploadPostsUserTolocaldb(u);
      log(p.toString());

      return emit(HomeLoaded(posts: p, users: u));
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  ///////
//////
  /// here the probleam still i can't figure it out the throught the problem lies in the life cycle
  /// bad event error
///////
  ////////

  void _getlastestpost(GetLastestPosts event, Emitter<HomeState> emit) async {
    try {
      final lastestPost = databasesrepository.getlastestPosts();
      _subscription = lastestPost.listen((event) async {
        if (event.events.contains(
            'databases.${AppwriteConstants.projectdatabases}.collections.${AppwriteConstants.postCollection}.documents.*.create')) {
          if (emit.isDone) {
            return emit(LastestPostLoaded(Post.fromMap(event.payload)));
          }
        }
      });
      //
    } on AppwriteException catch (e) {
      emit(HomeError(message: e.message.toString()));
    }
  }

  void _changeTheme(ChangeTheme event, Emitter<HomeState> emit) {
    final light = AppThemeMode().light;
    final dark = AppThemeMode().dark;

    if (event.theme == light) {
      event.theme == dark;
    } else if (event.theme == dark) {
      event.theme == light;
    }
  }

  void _deletePost(DeletePost event, Emitter<HomeState> emit) async {
    final post = event.post;
    emit(HomeLoading());
    try {
      await databasesrepository.deletePost(post.postid.toString());
      for (String link in post.imageLinks) {
        final id = link.substring(57, 43);
        await storagerepository.deleteFile(id.toString());
        debugPrint(id.toString());
      }
      debugPrint('the post id detected from the database and storage');
      return emit(const HomeError(message: 'Post Deleted successfully'));
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  void _likeAPost(LikeAPost event, Emitter<HomeState> emit) async {
    var post = event.post;
    final List<String> likes = post.likes;
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userId");
    try {
      if (post.likes.contains(userid.toString())) {
        likes.remove(event.post.userid);
        log('the post unliked');
        return;
      } else {
        likes.add(userid.toString());
        log('the post is liked');
      }
      post = post.copyWith(likes: post.likes);
      final res = await databasesrepository.likePost(post);
      log('the post liked $res');
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  void _usersearched(UserSearched event, Emitter<HomeState> emit) async {
    final searchString = event.search;
    try {
      final search = await databasesrepository.searchUsersByName(searchString);
      return emit(UserSearchedSuccessfully(
          search.map((e) => UserModel.fromMap(e.data)).toList()));
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  FutureOr<void> _commentPostedbyUser(
      CommentPostedByUser event, Emitter<HomeState> emit) async {
    try {
      final postid = event.postid;
      final comment = event.comment;
      String links = linksfromtext(comment);
      final hashtags = getHastags(comment);
      final String userid = await Caches().get('userId');
      if (comment.isEmpty) {
        return null;
      }
      await databasesrepository.postComment(Post(
          createdAt: DateTime.now(),
          repliedTo: postid,
          hashtags: hashtags,
          links: links,
          userid: userid,
          postid: '',
          posttext: comment,
          likes: const [],
          comments: const [],
          imageLinks: const []));
      return emit(CommentedSuccessfully());
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    log(change.toString());
  }

  @override
  void onEvent(HomeEvent event) {
    super.onEvent(event);
    log(event.toString());
  }
}
