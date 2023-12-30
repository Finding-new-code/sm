import 'package:appwrite/models.dart' as models;

import '../constants/tools.dart';

class Caches {
  SharedPreferences? _preferences;
  Future<void> set(String key, dynamic value) async {
    models.User? data;
    _preferences ??= await SharedPreferences.getInstance();
    data = value;
    await _preferences!.setString(key, data.toString());
  }

  Future<dynamic> get(String key) async {
    _preferences ??= await SharedPreferences.getInstance();
    final value = _preferences!.getString(key);
    if (value == null) return;
    return value;
  }

  Future<void> clear(String key) async {
    _preferences ??= await SharedPreferences.getInstance();
    await _preferences!.remove(key);
  }
}