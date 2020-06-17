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

  bool isOverdue() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final comparison =
        DateTime(this.dateTime.year, this.dateTime.month, this.dateTime.day);
    if (today == comparison) {
      return false;
    } else {
      return this.dateTime.isBefore(DateTime.now());
    }
  }

  void toggleDone() {
    isDone = !isDone;
  }
}
