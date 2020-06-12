import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final String remarks;
  final DateTime dateTime;
  final String date;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.remarks,
      this.dateTime,
      this.date,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        longPressCallback();
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
          taskTitle,
          style: TextStyle(
            fontFamily: 'pixelmix',
            fontSize: 20,
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          remarks + "\n\n" + date,
          style: TextStyle(
            fontFamily: 'pixelmix',
            fontSize: 14,
            color: Colors.grey[800],
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          activeColor: greenblue,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
