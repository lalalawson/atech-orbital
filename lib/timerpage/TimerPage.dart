import 'package:flutter/material.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/timerpage/countdown.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int focusTime = 25;
  int restTime = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      appBar: MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Focus Time ',
                    style: TextStyle(
                      fontFamily: 'pixelsix',
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    '$focusTime:00',
                    style: TextStyle(
                      fontFamily: 'PixelOperator',
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              Slider(
                value: focusTime.toDouble(),
                onChanged: (newValue) {
                  setState(() {
                    focusTime = newValue.toInt();
                  });
                },
                min: 10.0,
                max: 60.0,
                activeColor: darkCyan,
                inactiveColor: cyan,
              )
            ],
          ),
          Column(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rest Time ',
                    style: TextStyle(
                      fontFamily: 'pixelsix',
                      fontSize: 25.0,
                    ),
                  ),
                  Text(
                    '$restTime:00',
                    style: TextStyle(
                      fontFamily: 'PixelOperator',
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
              Slider(
                value: restTime.toDouble(),
                onChanged: (newValue) {
                  setState(() {
                    restTime = newValue.toInt();
                  });
                },
                min: 1.0,
                max: 15.0,
                activeColor: darkYellow,
                inactiveColor: yellow,
              )
            ],
          ),
          RaisedButton(
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CountDownTimer(
                          timeDuration: focusTime,
                        )),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Let's get started!",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'pixelsix',
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
