import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/const/components.dart';
import 'package:purrductive/const/routeNames.dart';

class CredentialsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TyperAnimatedTextKit(
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
            SizedBox(
              height: 20.0,
            ),
            TextField(
              style: TextStyle(
                fontFamily: 'pixelmix',
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
              decoration: kTextFieldInputDecoration.copyWith(
                hintText: 'username',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              style: TextStyle(
                fontFamily: 'pixelmix',
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
              decoration: kTextFieldInputDecoration.copyWith(
                hintText: 'password',
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, registrationPage);
              },
              child: Container(
                child: Text(
                  'new here? click here to sign up',
                  style: TextStyle(fontFamily: 'pixelmix', fontSize: 12.0),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
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
                  Navigator.pushNamed(context, homeScreen);
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
      ),
    );
  }
}
