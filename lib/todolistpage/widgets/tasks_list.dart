import 'package:flutter/material.dart';
import 'package:purrductive/todolistpage/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Column(
              children: <Widget>[
                TaskTile(
                  taskTitle: task.name,
                  remarks: task.remarks.isEmpty ? '' : '- ' + task.remarks,
                  dateTime: task.dateTime,
                  date: task.date,
                  isChecked: task.isDone,
                  checkboxCallback: (bool checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                ),
                Divider(),
              ],
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
