
class Task {
  List<Task> tasks;
  String note;
  DateTime completeWithin;
  bool completed;
  String repeats;
  DateTime deadline;
  List<DateTime> reminders;
  String taskId;
  String title;

  Task(this.title, this.note, this.completeWithin, 
  this.completed, this.deadline, this.reminders, this.repeats, this.taskId, this.tasks);

}