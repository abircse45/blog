import 'dart:convert';
import 'package:blog/api/api.dart';
import 'package:blog/model/auth_status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  AuthStatus status = AuthStatus.unauthenticated;

  Future<void> loginData(
      // ignore: non_constant_identifier_names
      String email,
      String password,
      String remember_me) async {
    final response = await http.post(
      BaseURL.LOGIN,
      body: {
        "email": email,
        "password": password,
        "remember_me": "1",
      },
      headers: {'Accept': 'application/json'},
    );

    try {
      var data = jsonDecode(response.body);
      // Check if User's Creds is valid,
      var isSuccess = data['Success'] == true; // Write you own condition;
      if (isSuccess) {
        status = AuthStatus.authenticated;
      } else {
        status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      status = AuthStatus.unauthenticated; // meaniful is
    }

    notifyListeners();
  }

  Future<void> registerData(
      String name,
      String email,
      String phone,
      // ignore: non_constant_identifier_names
      String password,
      String confirm_pass,
      String account_type) async {
    final response = await http.post(
      BaseURL.REGISTER,
      body: {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": confirm_pass,
        "account_type": account_type,
      },
      headers: {'Accept': 'application/json'},
    );

    try {
      var data = jsonDecode(response.body);
      // Check if User's Creds is valid,
      var isSuccess = data['Success'] == true; // Write you own condition;
      if (isSuccess) {
        status = AuthStatus.authenticated;
      } else {
        status = AuthStatus.unauthenticated;
      }
    } catch (e) {
      status = AuthStatus.unauthenticated; // meaniful is
    }

    notifyListeners();
  }
}
