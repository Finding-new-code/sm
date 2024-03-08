import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../constants/tools.dart';
import '../../../src/modals/post.dart';
import '../../../src/modals/usermodel.dart';
import '../../../src/repository/databases.dart';
import '../../../src/repository/storage.dart';
import '../../../src/themedata.dart';
import 'package:async/async.dart' show AsyncMemoizer;
import 'dart:async';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabasesRepository databasesrepository;
  final StorageRepository storagerepository;
  RealtimeSubscription? _subscription;
  HomeBloc({required this.databasesrepository, required this.storagerepository})
      : super(HomeInitial()) {
    on<GetNewPosts>(_getNewPosts);
    on<ChangeTheme>(_changeTheme);
    on<GetLastestPosts>(_getlastestpost);
    on<DeletePost>(_deletePost);
    on<LikeAPost>(_likeAPost);
  }

  // var localPostdatabase = Hive.box('PostsDatabase');

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
      log(p.toString());

      return emit(HomeLoaded(posts: p, users: u));
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  void _getlastestpost(GetLastestPosts event, Emitter<HomeState> emit) {
    try {
      final lastestPost = databasesrepository.getlastestPosts();
      _subscription = lastestPost.listen((event) {
        debugPrint(event.toString());
        return emit(LastestPostLoaded(Post.fromMap(event.payload)));
      }) as RealtimeSubscription?;
      // debugPrint('here the lastest post from the realtime $lastestPost');
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
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
      }
      //debugPrint('the post id delected from the database and storage');
      return emit(const HomeError(message: 'Post Deleted successfully'));
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  void _likeAPost(LikeAPost event, Emitter<HomeState> emit) async {
    final post = event.post;
    try {
      final prefes = await SharedPreferences.getInstance();
      final userid = prefes.getString('userId');
      if (post.likes.contains(userid)) {
        post.likes.remove(post.userid);
        log('the post unliked');
        return;
      }
      await databasesrepository.likePost(post);
      log('the post liked');
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription!.close;
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
