import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign In Page'),
            SizedBox(height: 20,),
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, PageTransition(
                child: SignUp(),
                type: PageTransitionType.leftToRightWithFade,
                duration: Duration(milliseconds: 500)
              )),
              child: Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign Up Page'),
            SizedBox(height: 20,),
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, PageTransition(
                child: SignIn(),
                type: PageTransitionType.rightToLeftWithFade,
                duration: Duration(milliseconds: 500)
              )),
              child: Text('Sign In'),
            )
          ],
        ),
      ),
    );
  }
}