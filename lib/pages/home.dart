import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({required Key key, required this.user}) : super(key: key);
  // final UserCredential user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
    );
  }
}
