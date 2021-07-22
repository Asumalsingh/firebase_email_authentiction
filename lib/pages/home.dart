import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);
  final UserCredential user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page '),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 100, top: 300),
            child: Text("Welcome",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(left: 90),
            child: Text("user: ${widget.user.user!.email}",
                style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
