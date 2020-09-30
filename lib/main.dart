import 'package:blog/model/auth_status.dart';
import 'package:blog/provider/data_provider.dart';
import 'package:blog/screen/home.dart';
import 'package:blog/widget/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/authenticate_provider.dart';
import 'screen/login.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (context) => Auth()),
        ChangeNotifierProvider<DataProvider>(
            create: (context) => DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
