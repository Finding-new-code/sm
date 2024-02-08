import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../../constants/tools.dart';
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
      debugPrint(id);
      final info =
          await databasesrepository.getcurrentUserDetails('65be40bdaab52bf06129');
      debugPrint('here the user info fetched from the server: $info');
      final i = UserModel.fromMap(info.data);
      debugPrint('here the user info fetched from the server: $i');
      return emit(ProfileLoaded(i));
    } on AppwriteException catch (e) {
      return emit(ProfileError(e.message.toString()));
    }
  }
}
