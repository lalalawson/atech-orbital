import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class PetHomePage extends StatefulWidget {
  @override
  _PetHomePageState createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 300),
            Container(
              color: mediumBlue,
              child: Text(
                "THIS IS WHERE THE PET'S HOME PAGE WILL BE",
                style: TextStyle(fontFamily: 'PressStart2P', fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 200),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.home,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
