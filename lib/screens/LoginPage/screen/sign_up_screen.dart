import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Login Account",style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Text("Hello, welcome back to our account")
              ],
            )
          ],
        ),
      ),
    );
  }
}
