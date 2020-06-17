import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:purrductive/todolistpage/task/task.dart';
import 'dart:collection';
import 'package:purrductive/const/months.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _overdueTask = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView<Task> get overdueTasks {
    return UnmodifiableListView(_overdueTask);
  }

  int get taskCount {
    return _tasks.length;
  }

  int get overdueTaskCount {
    int count = 0;
    for (int i = 0; i < _tasks.length; i++) {
      if (_tasks[i].isOverdue()) {
        count++;
      }
    }
    return count;
  }

  int get taskDone {
    int count = 0;
    for (var i = 0; i < _tasks.length; i++) {
      if (_tasks[i].isDone) {
        count += 1;
      }
    }
    return count;
  }

  int get taskLeft {
    return this.taskCount - this.taskDone;
  }

  bool get isEmpty {
    return this.taskCount == 0;
  }

  bool get overdueIsEmpty {
    return this.overdueTaskCount == 0;
  }

  double get progress {
    return this.taskDone / this.taskCount;
  }

  void addTask(String newTaskTitle, String newRemarks, DateTime dateTime) {
    String date = dateTime.day.toString() + " " + monthsInYear[dateTime.month];
    final task = Task(
      name: newTaskTitle,
      remarks: newRemarks,
      dateTime: dateTime,
      date: date,
      isOverDueTask: false,
    );
    _tasks.add(task);

    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void clearTasks() {
    _tasks = [];
    notifyListeners();
  }
}
