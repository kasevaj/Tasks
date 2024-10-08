import 'package:flutter/material.dart';
import 'package:task_app/models/global.dart';
import 'package:task_app/models/widgets/intray_task_widget.dart';

class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  // Initialize the list of items
  List<IntrayLog> logItems = [];

  @override
  void initState() {
    super.initState();
    // Populate the initial list of items
    logItems = getList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenColor,
      child: buildReorderableList(context), // Use the ReorderableListView
    );
  }

  Widget _buildListTile(BuildContext conetxt, IntrayLog item) {
    return ListTile(
      key: Key(item.keyValue),
      title: item,
    );
  }

  Widget buildReorderableList(BuildContext context) {

    return ReorderableListView(
      padding: const EdgeInsets.only(top: 300),
      children: logItems.map((IntrayLog item) => _buildListTile(context, item)).toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
        
          // Reorder the items in the list
          IntrayLog item = logItems[oldIndex];
          logItems.remove(item);
          logItems.insert(newIndex, item);
        });
      },
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
          // Adjust newIndex if it is moved down
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final IntrayLog item = logItems.removeAt(oldIndex);
          logItems.insert(newIndex, item);
    });
  }

  List<IntrayLog> getList() {
    // Generate the initial list of IntrayLog items
    List<IntrayLog> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(IntrayLog(keyValue: i.toString(), title: "Hello")); // Use unique titles for clarity
    }
    return list;
  }
}
