import 'package:blog/provider/authenticate_provider.dart';
import 'file:///D:/blog/lib/screen/login.dart';
import 'package:blog/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterWidget extends StatefulWidget {
  @override
  _RegisterWidgetState createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passController = TextEditingController();

  final confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Auth>(context);

    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: nameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.green,
                              ),
                              hintText: "Name",
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              fillColor: Colors.grey[300],
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.green,
                              ),
                              hintText: "Email",
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: phoneController,
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
                            obscureText: true,
                            controller: passController,
                            keyboardType: TextInputType.emailAddress,
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
                            height: 15,
                          ),
                          TextField(
                            obscureText: true,
                            controller: confirmPassController,
                            keyboardType: TextInputType.emailAddress,
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
                              hintText: "Confirm_password",
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            elevation: 15,
                            child: RoundedButton(
                              title: "Register",
                              onPress: () {
                                value.registerData(
                                    nameController.text,
                                    emailController.text,
                                    phoneController.text,
                                    passController.text,
                                    confirmPassController.text,
                                    "7");
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
                                "Already have an account",
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
                                          builder: (context) => Login()));
                                },
                                child: Text(
                                  "SignIn",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.all(15.0),
    //   child: Form(
    //     child: ListView(
    //       children: <Widget>[
    //         TextField(
    //           controller: nameController,
    //           decoration: InputDecoration(
    //             hintText: "Name",
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         TextField(
    //           controller: emailController,
    //           decoration: InputDecoration(
    //             hintText: "Email",
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         TextField(
    //           controller: phoneController,
    //           decoration: InputDecoration(
    //             hintText: "Phone",
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         TextField(
    //           controller: passController,
    //           decoration: InputDecoration(
    //             hintText: "Password",
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         TextField(
    //           controller: confirmPassController,
    //           decoration: InputDecoration(
    //             hintText: "ConfirmPass",
    //             border: OutlineInputBorder(),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         RaisedButton(
    //           onPressed: () {
    //             value.registerData(
    //                 nameController.text,
    //                 emailController.text,
    //                 phoneController.text,
    //                 passController.text,
    //                 confirmPassController.text,
    //                 "7");
    //           },
    //           child: Text("Register"),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
