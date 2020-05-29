import 'package:flutter/material.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:purrductive/const/colors.dart';
import 'package:timer_count_down/timer_count_down.dart';

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 300),
            Container(
              color: offWhite,
              child: Countdown(
                seconds: 10,
                build: (_, double time) => Text(
                  time.toString(),
                  style: TextStyle(fontSize: 50.0, fontFamily: 'PixelOperator'),
                ),
                //interval: Duration(milliseconds: 100),
                onFinished: () {
                  print('Timer is done!');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, homeScreen);
                  },
                  child: Icon(
                    Icons.home,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, toDoListPage);
                  },
                  child: Icon(
                    Icons.calendar_today,
                    size: 60,
                    color: Colors.yellow[800],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

//  Future goToHome(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => HomePage()));
//  }
//
//  Future goToToDoList(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => ToDoList()));
//  }
}
