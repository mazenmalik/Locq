import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:locq/widgets/locq_widgets.dart';
import 'package:locq/resources/app_string.dart';
import 'package:locq/view%20model/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  String? mobileNumber;
  bool? visible;
  @override
  void initState() {
    visible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppString.mobileNo),
                PhoneField(
                    onChanged: (value) => mobileNumber = value.completeNumber),
                PasswordTextField(
                    controller: passwordController,
                    hintText: AppString.password,
                    obsecure: visible!,
                    onTap: () => setState(() => visible = !visible!)),
                InkWell(
                    onTap: () {
                      Map data = {
                        "mobileNumber": mobileNumber.toString(),
                        "password": passwordController.text,
                        "profileType": "plc"
                      };
                      authViewModel.loginApi(data, context);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: LOCQButtonWidget(
                          text: AppString.signIn,
                          radius: 10.0,
                          width: double.maxFinite,
                        ))),
                authViewModel.loading ? LinearProgressIndicator() : SizedBox()
              ])),
    );
  }
}
