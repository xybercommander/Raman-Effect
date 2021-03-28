import 'package:flutter/material.dart';
import 'package:hoohack_demo/constants/constants.dart';
import 'package:hoohack_demo/helper/database_helper.dart';
import 'package:hoohack_demo/models/task_model.dart';
import 'package:hoohack_demo/screens/add_task_screen.dart';
import 'package:hoohack_demo/screens/profile_page.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';


class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  Future<List<Task>> _taskList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {    
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }



  Widget _buildTask(Task task) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          ListTile(
            title: Text(
              task.title,
              style: TextStyle(
                fontSize: 18,
                decoration: task.status == 0 ? TextDecoration.none : TextDecoration.lineThrough,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              '${_dateFormatter.format(task.date)} • ${task.priority}',
              style: TextStyle(
                fontSize: 15,
                decoration: task.status == 0 ? TextDecoration.none : TextDecoration.lineThrough,
                fontWeight: FontWeight.bold
              ),
            ),
            trailing: Checkbox(
              onChanged: (value) {                
                task.status = value ? 1 : 0;
                DatabaseHelper.instance.updateTask(task);
                _updateTaskList();
                // -------------POINT SYSTEM IMPLEMENTATION-------------
                if(task.status == 1) {
                  task.date.day < DateTime.now().day ? Constants.points += 3 : Constants.points += 5; 
                } else {
                  task.date.day < DateTime.now().day ? Constants.points -= 3 : Constants.points -= 5; 
                }
              },
              value: task.status == 1 ? true : false,
              activeColor: Theme.of(context).primaryColor,
            ),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskScreen(task: task, udpateTaskList: _updateTaskList,))),            
          ),
          Divider() // TODO remove the last divider
        ],
      ),
    );
  }


  // UI OF THE \TODO LIST
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {    

          // TODO SNAPSHOT IS SHOWING NULL
          if(!snapshot.hasData) {            
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // required in the title of the taskListPage
          final completedTaskList = snapshot.data
            .where((Task task) => task.status == 1)
            .toList()
            .length;

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 80),
            physics: BouncingScrollPhysics(),
            itemCount: 1 + snapshot.data.length,
            itemBuilder: (context, index) {
              if(index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My Tasks', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                            ),),
                          GestureDetector(
                            onTap: () => Navigator.push(context, PageTransition(
                              child: ProfilePage(),
                              type: PageTransitionType.rightToLeftWithFade
                            )),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.red
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: AssetImage(
                                    Constants.avatar == 1 ? 'assets/images/boy_avatar.png' : 'assets/images/girl_avatar.png'
                                  ),
                                  radius: 25,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        '$completedTaskList of ${snapshot.data.length}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),)
                    ],
                  ),
                );
              }

              return _buildTask(snapshot.data[index - 1]);
            },
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddTaskScreen(udpateTaskList: _updateTaskList,))),
      ),
    );
  }
}