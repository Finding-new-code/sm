import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp658d7b3746ed317621f8/src/src.dart';
import '../../../constants/tools.dart';
import '../../../src/modals/post.dart';
import '../../../src/modals/usermodel.dart';
import '../../../src/repository/databases.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DatabasesRepository databasesrepository;
  ProfileBloc({required this.databasesrepository}) : super(ProfileInitial()) {
    on<FetchCurrentUserData>(_getcurrentuserdata);
    on<FollowUser>(_followUser);
  }

  ///here the implementation for the getuser information so that we show these in the profile Page
  void _getcurrentuserdata(
      FetchCurrentUserData event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getString("userId");
      final info =
          await databasesrepository.getcurrentUserDetails(id.toString());
      final i = UserModel.fromMap(info.data);
      debugPrint('here the user info fetched from the server: $i');
      final userpost = await databasesrepository.getUserTweets(id.toString());
      final post = userpost.map((e) => Post.fromMap(e.data)).toList();
      debugPrint('here the user post fetched from the server: $post');
      return emit(ProfileLoaded(i, post));
    } on AppwriteException catch (e) {
      return emit(ProfileError(e.message.toString()));
    }
  }

  void _followUser(FollowUser event, Emitter<ProfileState> emit) async {
    try {
      final user = event.user;
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getString("userId");
      if (user.following.contains(id)) {
        return emit(UserUnfollowed());
      } else {
        await databasesrepository.followuser(user);
        return emit(Userfollowed());
      }
    } on AppwriteException catch (e) {
      return emit(ProfileError(e.toString()));
    }
  }

  //void _getuserData(FetchUserData event, Emitter<ProfileState> emit) async {}
}
