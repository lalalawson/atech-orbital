import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: 'logo',
              child: TyperAnimatedTextKit(
                speed: Duration(milliseconds: 200),
                pause: Duration(milliseconds: 1800),
                isRepeatingAnimation: true,
                text: ['purrductive'],
                textStyle: TextStyle(
                  fontFamily: 'pixelsix',
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            width: 200.0,
            child: RaisedButton(
              color: cyan,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  width: 4,
                  color: darkCyan,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, credentialsPage);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'pixelsix',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
