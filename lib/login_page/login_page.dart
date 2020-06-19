import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/routeNames.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Hero(
              tag: 'title',
              child: TyperAnimatedTextKit(
                speed: Duration(milliseconds: 200),
                pause: Duration(milliseconds: 1800),
                isRepeatingAnimation: false,
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
            height: 20.0,
          ),
          Hero(
            tag: 'log in',
            child: SizedBox(
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
          ),
          SizedBox(
            height: 20.0,
          ),
          Hero(
            tag: 'register',
            child: SizedBox(
              width: 200.0,
              child: RaisedButton(
                color: yellow,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    width: 4,
                    color: darkYellow,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, registrationPage);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'pixelsix',
                      color: Colors.black,
                    ),
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

//GestureDetector(
//onTap: () {
//Navigator.pushNamed(context, registrationPage);
//},
//child: Container(
//child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Text(
//'new here? ',
//style: TextStyle(
//fontFamily: 'pixelmix',
//fontSize: 15,
//),
//),
//Text(
//'sign up here',
//style: TextStyle(
//fontFamily: 'pixelmix',
//fontSize: 15,
//fontWeight: FontWeight.bold,
//color: darkCyan,
//),
//),
//],
//),
//),
//),
