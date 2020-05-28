import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:purrductive/HomePage.dart';
import 'package:purrductive/ToDoList.dart';

class Pomodoro extends StatefulWidget {
  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    const offWhite = const Color(0xFFeae2b7);
    const red = const Color(0xFFe63946);
    const lightBlue = const Color(0xFFa8dadc);
    const mediumBlue = const Color(0xFF457b9d);
    const darkBlue = const Color(0xFF1d3557);

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
            SizedBox(height: 400),
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
