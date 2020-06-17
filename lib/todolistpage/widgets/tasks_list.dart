import 'package:flutter/material.dart';
import 'package:flutter_list_drag_and_drop/drag_and_drop_list.dart';
import 'package:purrductive/todolistpage/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/todolistpage/task/TaskData.dart';
import 'package:purrductive/todolistpage/task/task.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        List<Task> TL = taskData.listTask;
        return DragAndDropList<Task>(
          TL,
          itemBuilder: (context, index) {
            final task = index;
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
          onDragFinish: (before, after) {
            Task data = TL[before];
            TL.removeAt(before);
            TL.insert(after, data);
          },
          canBeDraggedTo: (one, two) => true,
          dragElevation: 0.1,
        );
      },
    );
  }
}
