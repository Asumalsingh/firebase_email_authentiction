import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_email_authentiction/pages/home.dart';
import 'package:firebase_email_authentiction/pages/login.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign_up page"),
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
              onPressed: signUp,
              child: Text(
                'sign_up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp() async {
    //todo validate fields
    final FormState = _formKey.currentState;
    if (FormState!.validate()) {
      //todo login firebase
      FormState.save();
      try {
        UserCredential user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);

        await user.user!.sendEmailVerification();

        Navigator.of(context).pop();
        //todo Navigate to home
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e);
      }
    }
  }
}
