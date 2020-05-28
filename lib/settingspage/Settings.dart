import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
            Row(
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
                SizedBox(width: 63),
                Text("Settings",
                    style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 20,
                    ))
              ],
            ),
            SizedBox(height: 300),
            Container(
              color: mediumBlue,
              child: Text(
                "THIS IS WHERE THE SETTINGS WILL BE",
                style: TextStyle(fontSize: 20, fontFamily: 'PressStart2P'),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
