import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:purrductive/const/appbar.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: CircularCountDownTimer(
          textStyle: TextStyle(fontFamily: 'pixelsix', fontSize: 30.0),
          isReverse: true,
          color: Colors.white,
          fillColor: Colors.black,
          duration: 10,
          height: 200.0,
          width: 200.0,
        ),
      ),
    );
  }
}
