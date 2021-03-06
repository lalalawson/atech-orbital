import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Your list is empty!\nAdd a new task and \nget cracking!",
      style: TextStyle(
        fontSize: 40,
        fontFamily: 'PixelOperator',
      ),
      textAlign: TextAlign.center,
    );
  }
}
