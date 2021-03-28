import 'package:flutter/material.dart';
import 'package:hoohack_demo/constants/constants.dart';
import 'package:hoohack_demo/helper/sharedpreferences.dart';
import 'package:hoohack_demo/screens/mainPage.dart';
import 'package:hoohack_demo/screens/sign_up.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  getLoggedInState() async {
    bool log = await SharedPref.getLoggedInSharedPreference();
    setState(() {
      if(log == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = log;
      }
    });
  }

  @override
  void initState() {  
    getLoggedInState();
    Future.delayed(Duration(seconds: 3), () async {
      if(isLoggedIn == true) {
        Constants.name = await SharedPref.getNameSharedPreference();
        Constants.avatar = await SharedPref.getAvatarSharedPreference();
      }
      Navigator.pushReplacement(context, PageTransition(
        child: isLoggedIn ? MainPage() : SignUp(),
        type: PageTransitionType.bottomToTop
      ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hola!',style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}