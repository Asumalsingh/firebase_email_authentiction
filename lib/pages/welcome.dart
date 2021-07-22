import 'package:firebase_email_authentiction/pages/login.dart';
import 'package:firebase_email_authentiction/pages/sign_up.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My firebase app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: navigateToLogin,
            child: Text("login"),
          ),
          // ignore: deprecated_member_use
          RaisedButton(
            onPressed: navigateToSign_up,
            child: Text("sign_up"),
          ),
        ],
      ),
    );
  }

  void navigateToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void navigateToSign_up() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SignUpPage(), fullscreenDialog: true));
  }
}
