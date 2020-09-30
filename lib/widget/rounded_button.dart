import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Function onPress;

  RoundedButton({@required this.title, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 200,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.green,
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
