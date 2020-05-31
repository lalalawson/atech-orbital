import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
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
              color: Colors.cyan,
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
