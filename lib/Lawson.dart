import 'package:flutter/material.dart';

class Lawson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const offWhite = const Color(0xFFeae2b7);

    return Scaffold(
      backgroundColor: offWhite,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
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
        ],
      ),
    );
  }
}
