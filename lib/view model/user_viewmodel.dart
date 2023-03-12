import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  final String _token = '';
  String get token => _token;

  void saveUser(String key, String message) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, message);
    notifyListeners();
  }
}
