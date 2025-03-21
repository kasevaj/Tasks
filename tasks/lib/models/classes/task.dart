import 'dart:convert';

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

  Task(this.title, this.completed, this.taskId, this.note);

  Task.fromJson(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        completed = parsedJson['completed'],
        taskId = parsedJson['id'],
        note = parsedJson['note'],
        tasks = [];
}
