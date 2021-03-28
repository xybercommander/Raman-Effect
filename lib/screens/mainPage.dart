import 'package:flutter/material.dart';
import 'package:hoohack_demo/constants/constants.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,        
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(Constants.avatar == 1 ? 'assets/images/boy_avatar.png' : 'assets/images/girl_avatar.png'),
              radius: 50,
            ),
            SizedBox(height: 30,),
            Text(Constants.name, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}