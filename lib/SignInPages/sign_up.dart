import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameTextEditingController = TextEditingController();  

  int avatarSelector = 0; // 1 - Boy, 2 - Girl

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [                  
                  Image.asset('assets/images/girl.png', width: 155, height: 200,),
                  Image.asset('assets/images/boy.png', width: 155, height: 200,),
                ],
              ),
              Text(
                'Yay !\nCreate an account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text('Select an avatar!',style: TextStyle(fontSize: 30),),
              SizedBox(height: 10,),
              Row(              
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        avatarSelector = 1;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: avatarSelector == 1 ? Colors.red : Colors.transparent
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/boy_avatar.png'),
                          radius: 40,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        avatarSelector = 2;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: avatarSelector == 2 ? Colors.red : Colors.transparent
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/girl_avatar.png'),
                          radius: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              TextFormField(
                controller: _nameTextEditingController,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  labelText: 'What should we call you?',
                  labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ],            
          ),
        ),
      )
    );
  }
}