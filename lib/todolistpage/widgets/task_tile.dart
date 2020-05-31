import 'package:flutter/material.dart';
import 'package:purrductive/const/colors.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          longPressCallback();
        }
      },
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
        trailing: Checkbox(
          value: isChecked,
          activeColor: greenblue,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}
