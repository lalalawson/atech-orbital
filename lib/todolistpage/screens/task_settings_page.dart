import 'package:flutter/material.dart';

import 'package:purrductive/const/colors.dart';

class TaskSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      appBar: AppBar(
        backgroundColor: silverwhite,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          "Tasks Settings",
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'PixelOperator',
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
