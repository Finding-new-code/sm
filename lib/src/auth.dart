
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:myapp/constants/tools.dart';
import 'package:myapp/src/cache.dart';

class Auth extends ChangeNotifier {
  final Account account;
  Auth({required this.account});

  User? _current;
  User? get current => _current;

  Session? _session;
  Session? get session => _session;

  /// this is the Auth class
  /// here the Auth code implementation takes place =>

 /// here the login account code implementation takes place =>
  Future<void> loginAccount(String email, String password) async {
    final user =
        await account.createEmailSession(email: email, password: password);
    Caches().set("User", user);
    notifyListeners();
    debugPrint(
        "{${user.$id}, ${user.deviceName}, ${user.countryName}, ${user.$createdAt}, ${user.deviceBrand}}");
  }
  
  /// here the create account code implementation takes place =>
  Future<void> createAccount(String email, String password, String name) async {
    account.create(
        userId: ID.unique(), email: email, password: password, name: name);
    final user = await account.createEmailSession(email: email, password: password);
    Caches().set("User", user);
    notifyListeners();
  }

  Future<void> signOut() async {
    await account.deleteSession(sessionId: _session!.$id);
    _session = null;
    Caches().clear("User");
    notifyListeners();
  }
}