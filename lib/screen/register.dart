import 'package:blog/model/auth_status.dart';
import 'package:blog/provider/authenticate_provider.dart';
import 'package:blog/screen/home.dart';
import 'package:blog/widget/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Auth>(
        // ignore: missing_return
        builder: (context, value, child) {
          switch (value.status) {
            case AuthStatus.unauthenticated:
              return RegisterWidget();

            case AuthStatus.authenticated:
              return HomePage();
          }
        },
        child: RegisterWidget(),
      ),
    );
  }
}
