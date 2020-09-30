import 'package:blog/provider/authenticate_provider.dart';
import 'package:blog/screen/register.dart';
import 'package:blog/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<Auth>(context, listen: false);
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: email,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.green,
                            ),
                            hintText: "Phone",
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: pass,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.green,
                            ),
                            hintText: "Password",
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Card(
                          elevation: 15,
                          child: RoundedButton(
                            title: "Login",
                            onPress: () {
                              auth.loginData(email.text, pass.text, "1");
                            },
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "don\'t have an account?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[300]),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 18,
                                    decoration: TextDecoration.underline,
                                    color: Colors.grey[200]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
