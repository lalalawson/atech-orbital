import 'package:flutter/material.dart';
import 'package:purrductive/PetHomePage.dart';
import 'package:purrductive/PomodoroTimer.dart';
import 'package:purrductive/ToDoList.dart';
import 'package:purrductive/Settings.dart';
import 'package:purrductive/YongLer.dart';
import 'package:purrductive/Lawson.dart';

final Color offWhite = Color(0xFFeae2b7);
final Color red = Color(0xFFe63946);
final Color lightBlue = Color(0xFFa8dadc);
final Color mediumBlue = Color(0xFF457b9d);
final Color darkBlue = Color(0xFF1d3557);

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

    final controller = PageController(
      initialPage: 1,
    );

    final pageView = PageView(
      controller: controller,
      children: <Widget>[
        HomePage(),
        PetHomePage(),
      ],
    );

    return Scaffold(
      backgroundColor: offWhite,
      body: Stack(
        children: <Widget>[
          menu(context),
          homePage(context),
        ],
      ),
    );
  }

  Widget homePage(context) {
    return AnimatedPositioned(
      top: isCollapsed ? 0 : 0 * screenHeight,
      bottom: isCollapsed ? 0 : 0 * screenHeight,
      right: isCollapsed ? 0 : -0.6 * screenWidth,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Material(
        elevation: 15,
        color: offWhite,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 60, 0, 10),
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
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (isCollapsed) {
                    goToToDoList(context);
                  }
                },
                child: Image.asset('images/board.png'),
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  if (isCollapsed) {
                    goToPetHomePage(context);
                  }
                },
                child: Image.asset('images/lion.gif'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (isCollapsed) {
                        goToPomodoro(context);
                      }
                    },
                    child: Icon(
                      Icons.alarm,
                      size: 80,
                      color: Colors.redAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isCollapsed) {
                        goToToDoList(context);
                      }
                    },
                    child: Icon(
                      Icons.calendar_today,
                      size: 80,
                      color: Colors.yellow[800],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 80),
          Text(
            "PURRDUCTIVE",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'PressStart2P',
            ),
          ),
          SizedBox(height: 240),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    goToSettings(context);
                  },
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'PressStart2P',
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'PressStart2P',
                  ),
                ),
                SizedBox(height: 35),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'PressStart2P',
                    ),
                  ),
                ),
                SizedBox(height: 340),
                Row(
                  children: <Widget>[
                    Text(
                      "Made by Team A.Tech \n\nYong Ler and Lawson",
                      style: TextStyle(
                          fontSize: 8,
                          fontFamily: 'PressStart2P',
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
                )
              ],
            ),
          ),
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
