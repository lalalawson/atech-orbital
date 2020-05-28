import 'package:flutter/material.dart';
import 'package:purrductive/PomodoroTimer.dart';
import 'package:purrductive/HomePage.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
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
                "THIS IS WHERE THE TODO LIST WILL BE",
                style: TextStyle(fontSize: 20, fontFamily: 'PressStart2P'),
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
                    goToTimer(context);
                  },
                  child: Icon(
                    Icons.alarm,
                    size: 60,
                    color: Colors.redAccent,
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

  Future goToTimer(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Pomodoro()));
  }
}
