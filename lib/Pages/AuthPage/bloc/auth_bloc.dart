import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/src/modals/usermodel.dart';
import '../../../constants/tools.dart';
import '../../../src/repository/auth.dart';
import '../../../src/repository/databases.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final DatabasesRepository databasesrepsitory;
  AuthBloc({required this.authRepository, required this.databasesrepsitory})
      : super(AuthInitial()) {
    /// here you can place you event haldlers =>
    on<AsAuthRequest>(_asauthrequest);
    on<RecoveryPassword>(_recoveryPassword);
    on<Logout>(_accountLogout);
    on<AccountVerification> (_accountverification);
  }

  /// here the event handlers function body for better code readibility =>
  void _asauthrequest(AsAuthRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final String name = event.name;
      final String password = event.password;
      final String email = event.email;
      final bool isnew = event.isnew;

      if (email.isEmpty || password.isEmpty) {
        return emit(AuthFailure("Email or password is empty"));
      }
      if (email.isEmpty) {
        return emit(AuthFailure("Email is empty"));
      }
      if (password.isEmpty) {
        return emit(AuthFailure("Password is empty"));
      }
      if (password.length < 8) {
        return emit(AuthFailure("Password is too short"));
      }
      if (password.length > 32) {
        return emit(AuthFailure("Password is too long"));
      }
      if (!email.contains("@")) {
        return emit(AuthFailure("Email is not valid"));
      }
      
      final prefs = await SharedPreferences.getInstance();

      /// here the start of create account code implementation
      if (isnew == true) {
        final response =
            await authRepository.createAccount(email, password, name);
       final session = await authRepository.loginAccount(email, password);
        await databasesrepsitory.sendUserData(
            UserModel(
                name: response.name,
                bio: "",
                profilePicture: "",
                userid: response.$id,
                bannerPicture: "",
                isPremium: false,
                location: "",
                email: response.email,
                followers: const [],
                following: const [],
                posts: const [],
                likedPosts: const []),
            response.$id);
        authRepository.verifyAccount();

        prefs.setString("userId", response.$id);
        prefs.setString("SessionId", session.$id);
        /// this is just for testing purpose
        final id = prefs.getString("userId");
        debugPrint("here the userid get cached: $id");
        return emit(AuthSuccess(response.$id));

        /// here the end of create account code implementation
      } else {
        final session = await authRepository.loginAccount(email, password);

        prefs.setString("SessionId", session.$id);
        prefs.setString("userId", session.userId);

        /// this is just for testing purpose
        final id = prefs.getString("userId");
        debugPrint("here the userid got cached: $id");
        return emit(AuthSuccess(id));
      }
    } on AppwriteException catch (e) {
      return emit(AuthFailure(e.message.toString()));
    }
  }

  void _recoveryPassword(RecoveryPassword event, Emitter<AuthState> emit) {
    final emailid = event.email;

    if (emailid.isEmpty) {
      return emit(AuthFailure("Email is empty"));
    }
    if (!emailid.contains("@")) {
      return emit(AuthFailure("Email is not valid"));
    }
    try {
      authRepository.recoveryPassword(emailid);
    } on AppwriteException catch (e) {
      return emit(AuthFailure(e.message.toString()));
    }
  }

  void _accountLogout(Logout event, Emitter<AuthState> emit) async {
    try {
  final prefs = await SharedPreferences.getInstance();
  final sessionid = prefs.getString("SessionId");
  await authRepository.signOut(sessionid!);
  emit(AuthLogoutSuccess());
} on AppwriteException catch (e) {
   return emit(AuthFailure(e.message.toString()));
}
  }

  void _accountverification (AccountVerification event, Emitter<AuthState> emit) async{
   try {
  final token = await authRepository.verifyAccount();
  debugPrint(token.toString());
   return emit(AccountVerificationSuccess());
} on AppwriteException catch (e) {
  return emit(AuthFailure(e.message.toString()));
}
  }
}
