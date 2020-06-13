import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class TaskTile extends StatefulWidget {
  final Key key;
  final bool isChecked;
  final String taskTitle;
  final String remarks;
  final DateTime dateTime;
  final String date;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.key,
      this.isChecked,
      this.taskTitle,
      this.remarks,
      this.dateTime,
      this.date,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isOverdue() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final comparison = DateTime(
        widget.dateTime.year, widget.dateTime.month, widget.dateTime.day);
    if (today == comparison) {
      return false;
    } else {
      return widget.dateTime.isBefore(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        widget.longPressCallback();
      },
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.clear,
                size: 30,
                color: Colors.white,
              ),
              Text(
                "Delete",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontFamily: 'pixelmix',
                ),
              ),
            ],
          ),
        ),
      ),
      key: UniqueKey(),
      child: ListTile(
        title: Text(
          widget.taskTitle,
          style: TextStyle(
            fontFamily: 'pixelmix',
            fontSize: 20,
            color: Colors.black,
            decoration: widget.isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: widget.remarks.isEmpty
            ? null
            : Text(
                widget.remarks,
                style: TextStyle(
                  fontFamily: 'pixelmix',
                  fontSize: 14,
                  color: Colors.grey[800],
                  decoration:
                      widget.isChecked ? TextDecoration.lineThrough : null,
                ),
              ),
        leading: Checkbox(
          value: widget.isChecked,
          activeColor: greenblue,
          onChanged: widget.checkboxCallback,
        ),
        trailing: Text(
          widget.date,
          style: TextStyle(
            fontFamily: 'pixelmix',
            fontSize: 15,
            color: isOverdue() ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}
