import 'package:flutter/material.dart';
import 'package:purrductive/pethomepage/PetHomePage.dart';
import 'package:purrductive/timerpage/PomodoroTimer.dart';
import 'package:purrductive/todolistpage/ToDoList.dart';
import 'package:purrductive/settingspage/Settings.dart';
import 'package:purrductive/credits/YongLer.dart';
import 'package:purrductive/credits/Lawson.dart';
import 'package:purrductive/const/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: offWhite,
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx < 0) {
            goToPomodoro(context);
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
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0 * screenHeight,
      bottom: isCollapsed ? 0 : -0 * screenHeight,
      right: isCollapsed ? 0 : -0.6 * screenWidth,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: Material(
        elevation: 15,
        color: offWhite,
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
                //flex: 1,
                child: GestureDetector(
                  onTap: () {
                    if (isCollapsed) {
                      goToToDoList(context);
                    } else {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    }
                  },
                  child: Image.asset('images/board.png'),
                ),
              ),
              Expanded(
                //flex: 1,
                child: GestureDetector(
                  onTap: () {
                    if (isCollapsed) {
                      goToPetHomePage(context);
                    } else {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    }
                  },
                  child: Image.asset('images/lion.gif'),
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
                    goToSettings(context);
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
                    //TODO: Logout function
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
                    goToYongLer(context);
                  },
                  child: Image.asset('images/human1.png'),
                ),
                GestureDetector(
                  onTap: () {
                    goToLawson(context);
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

  Future goToPetHomePage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PetHomePage()));
  }

  Future goToPomodoro(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Pomodoro()));
  }

  Future goToToDoList(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ToDoList()));
  }

  Future goToSettings(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }

  Future goToYongLer(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => YongLer()));
  }

  Future goToLawson(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Lawson()));
  }
}
