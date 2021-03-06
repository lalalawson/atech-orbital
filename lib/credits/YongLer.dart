import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';

class YongLer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      appBar: MyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/pics.jpg'),
            ),
            SizedBox(height: 30),
            Text(
              "YONGLER",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "PressStart2P",
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.school),
            SizedBox(height: 10),
            Text(
              "Business Analytics",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "PressStart2P",
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.email),
            SizedBox(height: 10),
            Text(
              "tyongler.tang@gmail.com",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "PressStart2P",
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.alternate_email),
            SizedBox(height: 10),
            Text(
              "linkedin.com/in/yonglertang",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "PressStart2P",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/pics.jpg'),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "YONGLER",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "PressStart2P",
                    ),
                  ),
                  SizedBox(height: 30),
                  Icon(Icons.school),
                  SizedBox(height: 10),
                  Text(
                    "Business Analytics",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "PressStart2P",
                    ),
                  ),
                  SizedBox(height: 30),
                  Icon(Icons.email),
                  SizedBox(height: 10),
                  Text(
                    "tyongler.tang@gmail.com",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "PressStart2P",
                    ),
                  ),
                  SizedBox(height: 30),
                  Icon(Icons.alternate_email),
                  SizedBox(height: 10),
                  Text(
                    "linkedin.com/in/yonglertang",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: "PressStart2P",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
 */
