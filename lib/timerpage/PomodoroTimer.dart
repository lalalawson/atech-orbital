import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:purrductive/homepage/HomePage.dart';
import 'package:purrductive/todolistpage/ToDoList.dart';
import 'package:purrductive/const/colors.dart';

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
              color: mediumBlue,
              child: Text(
                "THIS IS WHERE THE TIMER WILL BE",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'PressStart2P',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    goToHome(context);
                  },
                  child: Icon(
                    Icons.home,
                    size: 60,
                    color: Colors.blueAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    goToToDoList(context);
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

  Future goToHome(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future goToToDoList(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ToDoList()));
  }
}
