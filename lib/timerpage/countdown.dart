import 'package:flutter/material.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/timerpage/CustomTimerPainter.dart';
import 'package:purrductive/timerpage/timer_settings.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  int focusTime = 25;
  int restTime = 5;
  AnimationController controller;

  void getFocusTime(int time) {
    focusTime = time;
  }

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: focusTime),
    );
  }

  @override
  Widget build(BuildContext context) {
    //ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(),
      backgroundColor: silverwhite,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Count Down Timer",
                          style: TextStyle(
                              fontFamily: 'pixelsix',
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        AnimatedBuilder(
                            animation: controller,
                            builder: (BuildContext context, Widget child) {
                              return Text(
                                controller.isAnimating
                                    ? timerString
                                    : '$focusTime:00',
                                style: TextStyle(
                                    fontFamily: 'PixelOperator',
                                    fontSize: 112.0,
                                    color: Colors.black),
                              );
                            }),
                      ],
                    ),
                  ),
                  RaisedButton(
                    //todo: design button better
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => TimerSettings(
                                focusTime: focusTime,
                                restTime: restTime,
                                focusTimeCallback: (time) {
                                  setState(() {
                                    getFocusTime(time);
                                  });
                                },
                              ));
                    },
                    child: Text('Settings'),
                  ),
                  //todo: to include studying gif and spinning hourglass
                  AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return FloatingActionButton.extended(
                            onPressed: () {
                              if (controller.isAnimating)
                                controller.stop();
                              else {
                                controller.reverse(
                                    from: controller.value == 0.0
                                        ? 1.0
                                        : controller.value);
                              }
                            },
                            icon: Icon(controller.isAnimating
                                ? Icons.pause
                                : Icons.play_arrow),
                            label: Text(
                                controller.isAnimating ? "Pause" : "Play"));
                      }),
                ],
              ),
            );
          }),
    );
  }
}

//body: AnimatedBuilder(
//animation: controller,
//builder: (context, child) {
//return Padding(
//padding: EdgeInsets.all(8.0),
//child: Column(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Expanded(
//child: Align(
//alignment: FractionalOffset.center,
//child: AspectRatio(
//aspectRatio: 1.0,
//child: Stack(
//children: <Widget>[
//Positioned.fill(
//child: AnimatedBuilder(
//animation: controller,
//builder: (BuildContext context, Widget child) {
//return CustomPaint(
//painter: CustomTimerPainter(
//animation: controller,
//backgroundColor: Colors.white,
//color: Colors.black,
//));
//},
//),
//),
//Align(
//alignment: FractionalOffset.topCenter,
//child: Column(
//mainAxisAlignment: MainAxisAlignment.center,
//crossAxisAlignment: CrossAxisAlignment.center,
//children: <Widget>[
//Text(
//"Count Down Timer",
//style: TextStyle(
//fontFamily: 'pixelsix',
//fontSize: 20.0,
//color: Colors.black),
//),
//AnimatedBuilder(
//animation: controller,
//builder:
//(BuildContext context, Widget child) {
//return Text(
//timerString,
//style: TextStyle(
//fontFamily: 'PixelOperator',
//fontSize: 112.0,
//color: Colors.black),
//);
//}),
//],
//),
//),
//],
//),
//),
//),
//),
//AnimatedBuilder(
//animation: controller,
//builder: (context, child) {
//return FloatingActionButton.extended(
//onPressed: () {
//if (controller.isAnimating)
//controller.stop();
//else {
//controller.reverse(
//from: controller.value == 0.0
//? 1.0
//    : controller.value);
//}
//},
//icon: Icon(controller.isAnimating
//? Icons.pause
//    : Icons.play_arrow),
//label: Text(
//controller.isAnimating ? "Pause" : "Play"));
//}),
//],
//),
//);
//}),
