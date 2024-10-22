import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../constants/tools.dart';
import '../../../src/modals/post.dart';
import '../../../src/modals/usermodel.dart';
import '../../../src/repository/databases.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final DatabasesRepository databasesrepository;
  ProfileBloc({required this.databasesrepository}) : super(ProfileInitial()) {
    on<GetUserData>(_getuserdata);
  }

  ///here the implementation for the getuser information so that we show these in the profile Page
  void _getuserdata(GetUserData event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final prefs = await SharedPreferences.getInstance();
    try {
      final id = prefs.getString("userId");
      final info =
          await databasesrepository.getcurrentUserDetails(id.toString());
      final i = UserModel.fromMap(info.data); 
      emit(ProfileLoaded(i));
      // debugPrint('here the user info fetched from the server: $i');
      final userpost = await databasesrepository.getUserTweets(id.toString());
      final post = userpost.map((e) => Post.fromMap(e.data)).toList();
     
      // emit(UserPosts(post));
    } on AppwriteException catch (e) {
      emit(ProfileError(e.message.toString()));
    }
  }

  @override
  void onChange(Change<ProfileState> change) {
    debugPrint('here the state is: ${change.nextState}');
    super.onChange(change);
  }
}
