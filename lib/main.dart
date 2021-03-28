import 'package:flutter/material.dart';
import 'package:hoohack_demo/SignInPages/sign_in.dart';
import 'package:hoohack_demo/SignInPages/sign_up.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.red,
        fontFamily: 'Quicksand'
      ),
      home: SignUp(),
    );
  }
}