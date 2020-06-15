class Task {
  final String name;
  final String remarks;
  final DateTime dateTime;
  final String date;
  bool isDone;
  bool isOverDueTask;

  Task({
    this.name,
    this.remarks,
    this.dateTime,
    this.date,
    this.isDone = false,
    this.isOverDueTask = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }
}
