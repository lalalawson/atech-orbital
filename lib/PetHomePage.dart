import 'package:flutter/material.dart';

class PetHomePage extends StatefulWidget {
  @override
  _PetHomePageState createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> {
  @override
  Widget build(BuildContext context) {
    const offWhite = const Color(0xFFeae2b7);
    const red = const Color(0xFFe63946);
    const lightBlue = const Color(0xFFa8dadc);
    const mediumBlue = const Color(0xFF457b9d);
    const darkBlue = const Color(0xFF1d3557);

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
            SizedBox(height: 300),
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
