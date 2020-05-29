import 'package:flutter/material.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';

class Lawson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: offWhite,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/lawson.jpg'),
            ),
            SizedBox(height: 30),
            Text(
              "LAWSON",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "PressStart2P",
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.school),
            SizedBox(height: 10),
            Text(
              "INFORMATION SYSTEMS",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "PressStart2P",
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.email),
            SizedBox(height: 10),
            Text(
              "lawson.tkw@gmail.com",
              style: TextStyle(
                fontSize: 13,
                fontFamily: "PressStart2P",
              ),
            ),
            SizedBox(height: 30),
            Icon(Icons.alternate_email),
            SizedBox(height: 10),
            Text(
              "linkedin.com/in/lawsont",
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
