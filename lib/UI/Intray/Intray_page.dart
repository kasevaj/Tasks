import 'package:flutter/material.dart';
import 'package:task_app/models/global.dart';
import 'package:task_app/models/widgets/intray_task_widget.dart';

class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  // Initialize the list of items
  List<IntrayLog> _items = [];

  @override
  void initState() {
    super.initState();
    // Populate the initial list of items
    _items = getList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: greenColor,
      child: buildReorderableList(context), // Use the ReorderableListView
    );
  }

  Widget buildReorderableList(BuildContext context) {

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < _items.length; index += 1)
          ListTile(
            key: Key('${_items[index].title}-$index'), // Use a unique key
            title: Text(_items[index].title), // Display the title from IntrayLog
          ),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          // Adjust newIndex if it is moved down
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          // Reorder the items in the list
          final IntrayLog item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }

  List<IntrayLog> getList() {
    // Generate the initial list of IntrayLog items
    List<IntrayLog> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(IntrayLog(title: "Hello")); // Use unique titles for clarity
    }
    return list;
  }
}
