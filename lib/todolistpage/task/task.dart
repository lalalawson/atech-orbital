class Task {
  final String name;
  final String remarks;
  final DateTime dateTime;
  final String date;
  bool isDone;

  Task(
      {this.name, this.remarks, this.dateTime, this.date, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
