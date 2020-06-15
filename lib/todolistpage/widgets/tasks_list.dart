import 'package:flutter/material.dart';
import 'package:purrductive/todolistpage/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Consumer<TaskData>(
        builder: (context, taskData, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TaskTile(
                  key: UniqueKey(),
                  taskTitle: task.name,
                  remarks: task.remarks.isEmpty ? '' : '- ' + task.remarks,
                  dateTime: task.dateTime,
                  date: task.date,
                  isChecked: task.isDone,
                  isOverdueTask: task.isOverDueTask,
                  checkboxCallback: (bool checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                ),
              );
            },
            itemCount: taskData.tasks.length,
          );
        },
      ),
    );
  }
}
