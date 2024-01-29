
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import '../../constants/tools.dart';
import '../cache.dart';

class AuthRepository {
  final Account _account;
  AuthRepository({required Account account}) : _account = account;

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
        Caches().set("UserSession", session);
    debugPrint(
        "{${session.$id}, ${session.deviceName}, ${session.ip}, ${session.countryName}, ${session.$createdAt}, ${session.deviceBrand}}");
        return session;
  }
  
  /// here the create account code implementation takes place =>
  Future<models.User> createAccount(String email, String password, String name) async {
   final user = _account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    Caches().set("User", user);
    return user;
  }

  Future<void> verifyAccount() async {
    await _account.createVerification(url: "");
  }

  Future<void> recoveryPassword (String email) async {
    _account.createRecovery(email: email, url: '');
  }

  // Future<void> signOut() async {
  //   await _account.deleteSession(sessionId:);
  //   Caches().clear("User");
  //   notifyListeners();
  // }
}
