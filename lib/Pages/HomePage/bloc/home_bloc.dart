import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/src/modals/usermodel.dart';
import '../../../constants/tools.dart';
import '../../../src/modals/post.dart';
import '../../../src/repository/databases.dart';
import '../../../src/repository/storage.dart';
import '../../../src/themedata.dart';
import 'package:async/async.dart' show AsyncMemoizer;
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabasesRepository databasesrepository;
  final StorageRepository storagerepository;
  HomeBloc({required this.databasesrepository, required this.storagerepository})
      : super(HomeInitial()) {
    on<GetNewPosts>(_getNewPosts);
    on<ChangeTheme>(_changeTheme);
    on<GetLastestPosts>(_getlastestpost);
    on<DeletePost>(_deletePost);
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
        log('here the data of user from the post id $userinfo.toString()');
        return userinfo;
      }

      List<UserModel> u = await getuseraspost();

      debugPrint('here the post fetched from the database $p');
      debugPrint(u.toString());

      return emit(HomeLoaded(posts: p, users: u));
    } on AppwriteException catch (e) {
      HomeError(message: e.message.toString());
    }
  }

  void _getlastestpost(GetLastestPosts event, Emitter<HomeState> emit) async {
    try {
      final lastestPost = databasesrepository.getLastestPosts();
      debugPrint('here the lastest post from the realtime $lastestPost');
      return emit(LastestPostLoaded(lastestPost));
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
      debugPrint('the post id delected from the database and storage');
      return emit(const HomeError(message: 'Post Deleted successfully'));
    } on AppwriteException catch (e) {
      return emit(HomeError(message: e.message.toString()));
    }
  }
}
