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
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                if (task.isDone) {
                  taskData.deleteTask(task);
                }
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
