import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/constants/tools.dart';
import '../../../src/modals/post.dart';
import '../../../src/repository/databases.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DatabasesRepository databasesrepository;
  HomeBloc({required this.databasesrepository}) : super(HomeInitial()) {
    on<GetNewPosts>(_getNewPosts);
  }

  void _getNewPosts(GetNewPosts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      Future<List<Post>> getPosts() async {
        final post = await databasesrepository.getPosts();
        debugPrint(post.toString());
        return post.map((e) => Post.fromMap(e.data)).toList();
      }

      List<Post> p = await getPosts();
      debugPrint(p.toString());

      return emit(HomeLoaded(p));
    } on AppwriteException catch (e) {
      HomeError(message: e.message.toString());
    }
  }
}
