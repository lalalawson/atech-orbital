import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class TimerSettings extends StatefulWidget {
  @override
  _TimerSettingsState createState() => _TimerSettingsState();

  TimerSettings({this.focusTimeCallback, this.focusTime, this.restTime});

  Function focusTimeCallback;
  int focusTime;
  int restTime;
}

class _TimerSettingsState extends State<TimerSettings> {
//  int focusTime = 25;
//  int restTime = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: silverwhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      '${widget.focusTime}:00',
                      style: TextStyle(
                        fontFamily: 'PixelOperator',
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: widget.focusTime.toDouble(),
                  onChanged: (newValue) {
                    setState(() {
                      widget.focusTime = newValue.toInt();
                    });
                  },
                  onChangeEnd: (newValue) {
                    widget.focusTimeCallback(newValue.toInt());
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
                      '${widget.restTime}:00',
                      style: TextStyle(
                        fontFamily: 'PixelOperator',
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: widget.restTime.toDouble(),
                  onChanged: (newValue) {
                    setState(() {
                      widget.restTime = newValue.toInt();
                    });
                  },
                  min: 1.0,
                  max: 15.0,
                  activeColor: darkYellow,
                  inactiveColor: yellow,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
