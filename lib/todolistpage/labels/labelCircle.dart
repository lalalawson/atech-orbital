import 'package:flutter/material.dart';

class LabelCircle extends StatefulWidget {
  final Key key;
  final String name;
  final Icon icon;
  final Color color;

  LabelCircle({
    this.key,
    this.name,
    this.icon,
    this.color,
  });

  @override
  _LabelCircleState createState() => _LabelCircleState();
}

class _LabelCircleState extends State<LabelCircle> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.color,
      child: Column(
        children: <Widget>[
          widget.icon,
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'pixelmix',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
