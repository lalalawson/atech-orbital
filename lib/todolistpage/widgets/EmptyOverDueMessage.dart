import 'package:flutter/material.dart';

class EmptyOverDueMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "No overdue tasks\nYAY!",
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'PixelOperator',
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
