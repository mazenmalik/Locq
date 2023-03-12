import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view model/user_viewmodel.dart';
import 'package:locq/view/authentication/login.dart';
import 'package:locq/view%20model/auth_viewmodel.dart';
import 'package:locq/view%20model/spin_viewmodel.dart';
import 'package:locq/view%20model/station_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => SpinViewModel()),
        ChangeNotifierProvider(create: (_) => StationListViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Assestment',
        theme: ThemeData(primarySwatch: Colors.grey),
        home: const LoginScreen(),
      ),
    );
  }
}
