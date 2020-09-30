import 'package:blog/model/auth_status.dart';
import 'package:blog/provider/authenticate_provider.dart';
import 'package:blog/screen/home.dart';
import 'package:blog/screen/register.dart';
import 'package:blog/widget/login_widget.dart';
import 'package:blog/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<Auth>(
      // ignore: missing_return
      builder: (context, auth, child) {
        switch (auth.status) {
          case AuthStatus.unauthenticated:
            return LoginWidget();

          case AuthStatus.authenticated:
            return HomePage();
        }
      },
      child: LoginWidget(),
    ));
  }
}
