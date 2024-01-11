
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
    final user =
        await _account.createEmailSession(email: email, password: password);
        Caches().set("UserSession", user);
    // notifyListeners();
    debugPrint(
        "{${user.$id}, ${user.deviceName}, ${user.countryName}, ${user.$createdAt}, ${user.deviceBrand}}");
        return user;
  }
  
  /// here the create account code implementation takes place =>
  Future<models.User> createAccount(String email, String password, String name) async {
   final user = _account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    Caches().set("User", user);
    // notifyListeners();
    return user;
  }

  // Future<void> signOut() async {
  //   await account.deleteSession(sessionId: _session!.$id);
  //   _session = null;
  //   Caches().clear("User");
  //   // notifyListeners();
  // }
}
