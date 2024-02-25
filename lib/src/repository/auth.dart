
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import '../../constants/tools.dart';
import '../cache.dart';

class AuthRepository {
  final Account _account;
  AuthRepository({required Account account}) : _account = account;

  /// here the current user code implementation takes place, get the info currents device details =>
  Future<models.User?> currentUser() async {
    final user = await Caches().get("User");
    final usersession = await Caches().get("UserSession");
    if (user.isEmpty && usersession.isEmpty) {
      return await _account.get();
    } else {
      return null;
    }
  }

 /// here the login account code implementation takes place =>
  Future<models.Session> loginAccount(String email, String password) async {
    final session =
        await _account.createEmailSession(email: email, password: password);
        // Caches().set("UserSession", session);
    debugPrint(
        "{${session.$id}, ${session.deviceName}, ${session.ip}, ${session.countryName}, ${session.$createdAt}, ${session.deviceBrand}}");
        return session;
  }
  
  /// here the create account code implementation takes place =>
  Future<models.User> createAccount(String email, String password, String name) async {
   final user = _account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    // Caches().set("User", user);
    return user;
  }
 ///  here the implementation for the verify account by send email with verification LINKS   =>
  Future<models.Token> verifyAccount() async {
    return await _account.createVerification(url: "https://example-test-c6d6a.web.app/");
  }

  /// here the implemetation for the forgot password takes place,
  /// it follows the the process as the email verification process =>
  Future<void> recoveryPassword (String email) async {
    _account.createRecovery(email: email, url: 'https://example-test-c6d6a.web.app/');
  }

  /// here the implemetation for the reset password takes place,
  /// it follows the the process as the email verification process =>
  Future<void> signOut(String sessionid) async {
    await _account.deleteSession(sessionId:sessionid);
    Caches().clear("User");

  }
}
