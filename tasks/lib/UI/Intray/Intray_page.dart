import 'package:flutter/material.dart';
import 'package:tasks/models/classes/task.dart';
import 'package:tasks/models/global.dart';
import 'package:tasks/models/widgets/intray_task_widget.dart';

class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  // Initialize the list of items
  List<Task> taskList = [];

  @override
  void initState() {
    super.initState();
    // Populate the initial list of items
    taskList = getList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGrey,
      child: buildReorderableList(context), // Use the ReorderableListView
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
      key: ValueKey(item.taskId), // Use ValueKey here as well
      title: IntrayLog(
        keyValue: item.taskId,
        title: item.title,
      ),
    );
  }
  // Widget _buildListTile(BuildContext context, Task item) {
  //  return ListTile(
  //  key: ValueKey(item.taskId),
  //title: IntrayLog(keyValue: item.taskId, title: item.title,
  //    ),
  // );
  //}

  Widget buildReorderableList(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: ReorderableListView(
        padding: const EdgeInsets.only(top: 300),
        children:
            taskList.map((Task item) => _buildListTile(context, item)).toList(),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            // Reorder the items in the list
            Task item = taskList[oldIndex];
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            taskList.remove(item);
            taskList.insert(newIndex, item);
          });
        },
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      // Adjust newIndex if it is moved down
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  List<Task> getList() {
    // Generate the initial list of IntrayLog items TESTTESTESTESTESTESTSETSETSET
    for (int i = 0; i < 10; i++) {
      taskList.add(Task(
          "Buy groceries" "$i", // title
          "Buy milk, bread, and eggs", // note
          DateTime.now()
              .add(Duration(days: i)), // completeWithin (3 days from now)
          false, // completed (not completed)
          DateTime.now().add(Duration(days: 2)), // deadline (2 days from now)
          [
            DateTime.now().add(Duration(days: 1)), // reminder (1 day from now)
            DateTime.now()
                .add(Duration(hours: 36)), // reminder (1.5 days from now)
          ],
          "daily", // repeats (e.g., "daily")
          "task"
              "$i", // taskId
          [] // tasks (no sub-tasks)
          )); // Use unique titles for clarity
    }
    return taskList;
  }
}
