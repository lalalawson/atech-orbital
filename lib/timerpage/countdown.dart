import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purrductive/const/appbar.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/timerpage/CustomTimerPainter.dart';
import 'package:purrductive/timerpage/timer_end_dialog.dart';
import 'package:purrductive/timerpage/timer_settings.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();

  final int timeDuration;
  final int restTime;

  CountDownTimer({this.timeDuration, this.restTime});
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;
  bool hasStarted = false;
  bool startWork = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

//minutes: widget.timeDuration
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return TimerEndDialog(
                timeToCoins: widget.timeDuration,
                restTime: widget.restTime,
              );
            });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget startingText(String text) {
    //hasStarted = true;
    return Text(
      '$text:00',
      style: TextStyle(
          fontFamily: 'PixelOperator', fontSize: 112.0, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Time to focus!",
                            style: TextStyle(
                                fontFamily: 'pixelsix',
                                fontSize: 20.0,
                                color: Colors.black),
                          ),
                          hasStarted
                              ? AnimatedBuilder(
                                  animation: controller,
                                  builder:
                                      (BuildContext context, Widget child) {
                                    return Text(
                                      timerString,
                                      style: TextStyle(
                                          fontFamily: 'PixelOperator',
                                          fontSize: 112.0,
                                          color: Colors.black),
                                    );
                                  })
                              : startingText(widget.timeDuration.toString()),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      startWork
                          ? 'images/cat_studying.gif'
                          : 'images/cat_study.png',
                      height: 200.0,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Container(
                        height: 60.0,
                        width: 130.0,
                        child: RaisedButton(
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
                            setState(() {
                              hasStarted = true;
                              startWork = true;
                              if (controller.isAnimating) {
                                controller.stop();
                                startWork = false;
                              } else {
                                controller.reverse(
                                    from: controller.value == 0.0
                                        ? 1.0
                                        : controller.value);
                              }
                            });
                          },
                          child: Row(
                            children: [
                              Icon(controller.isAnimating
                                  ? Icons.pause
                                  : Icons.play_arrow),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                controller.isAnimating ? "Pause" : "Start",
                                style: TextStyle(
                                    fontFamily: 'pixelsix',
                                    fontSize: 20.0,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
