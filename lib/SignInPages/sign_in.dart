import 'package:flutter/material.dart';
import 'package:hoohack_demo/SignInPages/sign_up.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello.\nWelcome Back!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 70,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // -----------EMAIL TEXT FIELD-----------
                  TextFormField(
                    controller: _emailTextEditingController,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                  SizedBox(height: 20,),
                  // -----------PASSWORD TEXT FIELD-----------
                  TextFormField(
                    controller: _passwordTextEditingController,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
