import 'dart:math';

import 'package:flutter/material.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/todolistpage/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;

class HomePage extends StatefulWidget {
  String username;
  HomePage({Key key, this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
//      username = await _firestore
//          .collection("users")
//          .document(user.uid)
//          .get()
//          .then((value) => username = value.data['username']);
//      setState(() {});
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    String name = widget.username;

    return Scaffold(
      backgroundColor: silverwhite,
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx < 0) {
            if (isCollapsed) {
              Navigator.pushNamed(context, timerPage);
            }
          } else {
            setState(() {
              isCollapsed = !isCollapsed;
            });
          }
        },
        child: Stack(
          children: <Widget>[
            menu(context),
            homePage(context),
          ],
        ),
      ),
    );
  }

  Widget homePage(context) {
    String name = widget.username;
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0 * screenHeight,
      bottom: isCollapsed ? 0 : -0 * screenHeight,
      right: isCollapsed ? 0 : -0.6 * screenWidth,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: Material(
        elevation: 15,
        color: silverwhite,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      onTap: () {
                        setState(() {
                          isCollapsed = !isCollapsed;
                        });
                      },
                    ),
                  )
                ],
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isCollapsed) {
                      Navigator.pushNamed(context, toDoListPage);
                    } else {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    }
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('images/board.png'),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Welcome back\n\n$name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'pixelmix',
                              letterSpacing: 3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              '${Provider.of<TaskData>(context).taskLeft} Tasks left to do',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontFamily: 'PixelOperator',
                                letterSpacing: 2.5,
                              ),
                            ),
                          ),
                          Text(
                            '${Provider.of<TaskData>(context).overdueTaskCount} Tasks overdue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontFamily: 'PixelOperator',
                              letterSpacing: 2.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isCollapsed) {
                      Navigator.pushNamed(context, petHomePage);
                    } else {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    }
                  },
                  child: Image.asset('images/cat.gif'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu(context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "PURRDUCTIVE",
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'pixelsix',
              ),
            ),
          ),
          SizedBox(height: 100),
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  //contentPadding: EdgeInsets.all(8.0),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, settingsPage);
                  },
                  title: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'pixelmix',
                    ),
                  ),
                ),
                ListTile(
                  //contentPadding: EdgeInsets.all(8.0),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  onTap: () {
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'pixelmix',
                    ),
                  ),
                ),
                ListTile(
                  //contentPadding: EdgeInsets.all(8.0),
                  leading: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  title: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'pixelmix',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Made by Team A.Tech \n\nYong Ler and Lawson",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'PixelOperator',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, yongler);
                  },
                  child: Image.asset('images/human1.png'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, lawson);
                  },
                  child: Image.asset('images/human2.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//  Future goToPetHomePage(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => PetHomePage()));
//  }
//
//  Future goToPomodoro(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => Pomodoro()));
//  }
//
//  Future goToToDoList(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => ToDoList()));
//  }
//
//  Future goToSettings(context) async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => Settings()));
//  }
//
//  Future goToYongLer(context) async {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => YongLer()));
//  }
//
//  Future goToLawson(context) async {
//    Navigator.push(context, MaterialPageRoute(builder: (context) => Lawson()));
//  }
}
