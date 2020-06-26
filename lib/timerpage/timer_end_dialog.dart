import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/timerpage/rest_page.dart';

class TimerEndDialog extends StatelessWidget {
  TimerEndDialog({this.timeToCoins, this.restTime});

  final int timeToCoins;
  final int restTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Good job!'),
      titleTextStyle: TextStyle(
        fontFamily: 'pixelsix',
        color: Colors.black,
        fontSize: 24.0,
      ),
      content: Text('You have earned ${timeToCoins * 2} coins!'),
      contentTextStyle: TextStyle(
        fontFamily: 'PixelOperator',
        color: Colors.black,
        fontSize: 22.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actions: [
        FlatButton(
          textColor: darkCyan,
          child: Text(
            'Nice!',
            style: TextStyle(fontFamily: 'pixelmix'),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestPage(
                        restTime: restTime,
                      )),
            );
          },
        ),
      ],
    );
  }
}
