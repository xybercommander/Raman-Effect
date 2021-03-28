import 'package:flutter/material.dart';
import 'package:hoohack_demo/constants/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  Widget ranks(String rankImg, String rank, String points) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 20,
      height: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$rankImg.png', width: 70, height: 70,),
          Text('$rank', style: TextStyle(fontWeight: FontWeight.bold),),
          Text('$points points', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),)
        ],
      )
    );
  }


  Widget profileRank(int points) {
    if(points >= 0 && points < 60) {
      return Text('Rank: Unranked', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    } else if(points >= 60 && points < 120) {
      return Text('Rank: Newbie Tasker', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    } else if(points >= 120 && points < 180) {
      return Text('Rank: Rookie Tasker', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    } else if(points >= 180 && points < 240) {
      return Text('Rank: Pro Tasker', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    } else if(points >= 240 && points < 300) {
      return Text('Rank: Specialist Tasker', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    } else if(points >= 300 && points < 420) {
      return Text('Rank: Expert Tasker', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    } else if(points >= 420 && points < 600) {
      return Text('Rank: Master Tasker', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    } else {
      return Text('Rank: Champion Tasker', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),);
    }
  }

  Widget avatarRank(int points) {
    if(points >= 0 && points < 60) {
      return SizedBox.shrink();
    } else if(points >= 60 && points < 120) {
      return Image.asset('assets/images/rank1.png', height: 35, width: 35,);
    } else if(points >= 120 && points < 180) {
      return Image.asset('assets/images/rank2.png', height: 35, width: 35,);
    } else if(points >= 180 && points < 240) {
      return Image.asset('assets/images/rank3.png', height: 35, width: 35,);
    } else if(points >= 240 && points < 300) {
      return Image.asset('assets/images/rank4.png', height: 35, width: 35,);
    } else if(points >= 300 && points < 420) {
      return Image.asset('assets/images/rank5.png', height: 35, width: 35,);
    } else if(points >= 420 && points < 600) {
      return Image.asset('assets/images/rank6.png', height: 35, width: 35,);
    } else {
      return Image.asset('assets/images/rank7.png', height: 35, width: 35,);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,           
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(Constants.avatar == 1 ? 'assets/images/boy_avatar.png' : 'assets/images/girl_avatar.png'),
                    radius: 50,
                  ),
                  avatarRank(Constants.points)
                ],
              ),
              SizedBox(height: 10,),
              Text(Constants.name, style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
              Text('Points: ${Constants.points}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              profileRank(Constants.points),
              SizedBox(height: 30,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ranks('rank1', 'Newbie Tasker', '60'),
                      ranks('rank2', 'Rookie Tasker', '120'),
                      ranks('rank3', 'Pro Tasker', '180'),                    
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ranks('rank4', 'Specialist Tasker', '240'),
                      ranks('rank5', 'Expert Tasker', '300'),
                      ranks('rank6', 'Master Tasker', '420'), 
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    height: MediaQuery.of(context).size.width / 2 - 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/rank7.png', width: 100, height: 100,),
                        Text('Champion Tasker', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        Text('600 points', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),)
                      ],
                    )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}