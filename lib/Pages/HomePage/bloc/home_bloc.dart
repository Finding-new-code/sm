import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../constants/tools.dart';
import '../../../src/modals/post.dart';
import '../../../src/repository/databases.dart';
import '../../../src/themedata.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabasesRepository databasesrepository;
  HomeBloc({required this.databasesrepository}) : super(HomeInitial()) {
    on<GetNewPosts>(_getNewPosts);
    on<ChangeTheme>(_changeTheme);
    on<GetLastestPosts>(_getlastestpost);
  }

 // var localPostdatabase = Hive.box('PostsDatabase');

  void _getNewPosts(GetNewPosts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      Future<List<Post>> getPosts() async {
        final post = await databasesrepository.getPosts();
        debugPrint(post.toString());
        return post.map((e) => Post.fromMap(e.data)).toList();
      }
      List<Post> p = await getPosts();
     // List<UserModel> userifo  = await databasesrepository.getcurrentUserDetails(p.);

      debugPrint('here the post from the realtime $p');
      debugPrint(p.toString());

      return emit(HomeLoaded(p));
    } on AppwriteException catch (e) {
      HomeError(message: e.message.toString());
    }
  }

  void _getlastestpost(GetLastestPosts event, Emitter<HomeState> emit) async{
    try {
      final lastestPost = databasesrepository.getLastestPosts();
      debugPrint('here the lastest post from the realtime $lastestPost');
      return emit(LastestPostLoaded());
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
}
