import 'package:flutter/material.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:purrductive/credits/Lawson.dart';
import 'package:purrductive/credits/YongLer.dart';
import 'package:purrductive/homepage/HomePage.dart';
import 'package:purrductive/pethomepage/PetHomePage.dart';
import 'package:purrductive/settingspage/Settings.dart';
import 'package:purrductive/timerpage/PomodoroTimer.dart';
import 'package:purrductive/todolistpage/ToDoList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'purrductive',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        homeScreen: (BuildContext context) => HomePage(),
        lawson: (BuildContext context) => Lawson(),
        yongler: (BuildContext context) => YongLer(),
        petHomePage: (BuildContext context) => PetHomePage(),
        settingsPage: (BuildContext context) => Settings(),
        timerPage: (BuildContext context) => Pomodoro(),
        toDoListPage: (BuildContext context) => ToDoList(),
      },
    );
  }
}
