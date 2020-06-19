import 'package:flutter/material.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:purrductive/credits/Lawson.dart';
import 'package:purrductive/credits/YongLer.dart';
import 'package:purrductive/homepage/HomePage.dart';
import 'package:purrductive/login_page/credentials_page.dart';
import 'package:purrductive/login_page/registration_page.dart';
import 'package:purrductive/pethomepage/PetHomePage.dart';
import 'package:purrductive/settingspage/Settings.dart';
import 'package:purrductive/timerpage/countdown.dart';
import 'package:purrductive/todolistpage/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';
import 'package:purrductive/login_page/login_page.dart';

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
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        title: 'purrductive',
        home: LoginPage(),
        routes: <String, WidgetBuilder>{
          loginPage: (BuildContext context) => LoginPage(),
          credentialsPage: (BuildContext context) => CredentialsPage(),
          registrationPage: (BuildContext context) => RegistrationPage(),
          homeScreen: (BuildContext context) => HomePage(),
          lawson: (BuildContext context) => Lawson(),
          yongler: (BuildContext context) => YongLer(),
          petHomePage: (BuildContext context) => PetHomePage(),
          settingsPage: (BuildContext context) => Settings(),
          timerPage: (BuildContext context) => CountDownTimer(),
          toDoListPage: (BuildContext context) => TasksScreen(),
        },
      ),
    );
  }
}
