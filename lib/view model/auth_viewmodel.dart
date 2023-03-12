import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../data/repository/auth_repository.dart';
import 'package:locq/view%20model/user_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:locq/view/landing%20screen/landing_screen.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  SharedPreferences? sharedPreferences;

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      final userViewModel = Provider.of<UserViewModel>(context, listen: false);
      userViewModel.saveUser('token', value['data']['AccessToken'].toString());
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LandingScreen()));
      if (kDebugMode) {
        print(value['data']['AccessToken'].toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Incorrect username or password'),
          backgroundColor: Colors.grey));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
