import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';
import 'package:purrductive/timerpage/timer_end_dialog.dart';

import 'countdown.dart';

class RestPage extends StatefulWidget {
  @override
  _RestPageState createState() => _RestPageState();

  RestPage({this.restTime});
  final int restTime;
}

class _RestPageState extends State<RestPage> with TickerProviderStateMixin {
  AnimationController controller;
  bool hasStarted = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

//minutes: widget.restTime
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Break Over!'),
                titleTextStyle: TextStyle(
                  fontFamily: 'pixelsix',
                  color: Colors.black,
                  fontSize: 24.0,
                ),
                content: Text('Time to get back to work!'),
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
                      'Let\'s Go!',
                      style: TextStyle(fontFamily: 'pixelmix'),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ],
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
    hasStarted = true;
    return Text(
      '$text:00',
      style: TextStyle(
          fontFamily: 'PixelOperator', fontSize: 112.0, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offWhite,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Break Time!",
                          style: TextStyle(
                              fontFamily: 'pixelsix',
                              fontSize: 20.0,
                              color: Colors.black),
                        ),
                        hasStarted
                            ? AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: TextStyle(
                                        fontFamily: 'PixelOperator',
                                        fontSize: 112.0,
                                        color: Colors.black),
                                  );
                                })
                            : startingText(widget.restTime.toString()),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50.0,
                        width: 150.0,
                        child: RaisedButton(
                          color: yellow,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              width: 4,
                              color: darkYellow,
                            ),
                          ),
                          child: Text(
                            'Skip break!',
                            style: TextStyle(
                                fontFamily: 'pixelsix',
                                fontSize: 20.0,
                                color: Colors.black),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Skip your break?'),
                                    titleTextStyle: TextStyle(
                                      fontFamily: 'pixelsix',
                                      color: Colors.black,
                                      fontSize: 24.0,
                                    ),
                                    content: Text(
                                        'Remember to take a breather every once in awhile!'),
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
                                          'Skip!',
                                          style:
                                              TextStyle(fontFamily: 'pixelmix'),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      FlatButton(
                                        textColor: darkCyan,
                                        child: Text(
                                          'Stay!',
                                          style:
                                              TextStyle(fontFamily: 'pixelmix'),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return Container(
                              height: 50.0,
                              width: 150.0,
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
                                    if (controller.isAnimating)
                                      controller.stop();
                                    else {
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
                                      controller.isAnimating
                                          ? "Pause"
                                          : "Start",
                                      style: TextStyle(
                                          fontFamily: 'pixelsix',
                                          fontSize: 20.0,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
