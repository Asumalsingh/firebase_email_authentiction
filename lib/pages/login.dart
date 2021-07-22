import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_authentiction/pages/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login page"),
      ),
      body: Form(
        //todo implement key
        key: _formKey,

        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10)),

            //todo implement field
            TextFormField(
              validator: (input) {
                if (input!.isEmpty) {
                  return "please enter an email";
                }
              },
              onSaved: (input) => _email = input!,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 10),
            TextFormField(
              validator: (input) {
                if (input!.isEmpty) {
                  return "please enter an password";
                } else if (input.length < 8) {
                  return "your password needs to be atleast 8 charactors";
                }
              },
              onSaved: (input) => _password = input!,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: signIn,
              child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    //todo validate fields
    final FormState = _formKey.currentState;
    if (FormState!.validate()) {
      //todo login firebase
      FormState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        //todo Navigate to home
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        print(e);
      }
    }
  }
}
