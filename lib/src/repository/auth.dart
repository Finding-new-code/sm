
import 'package:flutter/material.dart';
import '../../constants/tools.dart';

class AuthRepository {
  final Account account;
  AuthRepository({required this.account});

 /// here the login account code implementation takes place =>
  Future<void> loginAccount(String email, String password) async {
    final user =
        await account.createEmailSession(email: email, password: password);
    // Caches().set("User", user);
    // notifyListeners();
    debugPrint(
        "{${user.$id}, ${user.deviceName}, ${user.countryName}, ${user.$createdAt}, ${user.deviceBrand}}");
  }
  
  /// here the create account code implementation takes place =>
  Future<void> createAccount(String email, String password, String name) async {
    account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    final user = await account.createEmailSession(email: email, password: password);
    // Caches().set("User", user);
    // notifyListeners();
  }

  // Future<void> signOut() async {
  //   await account.deleteSession(sessionId: _session!.$id);
  //   _session = null;
  //   Caches().clear("User");
  //   // notifyListeners();
  // }
}
