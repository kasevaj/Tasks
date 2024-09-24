import 'package:flutter/material.dart';
import 'package:task_app/models/global.dart';
import 'package:task_app/models/widgets/intray_task_widget.dart';


class IntrayPage extends StatefulWidget {

  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGrey,
      child: ListView(
        padding: EdgeInsets.only(top: 300),
        children: getList(),
      ),
    );
  }
  List<Widget> getList() {
    List<IntrayLog> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(IntrayLog(title: "Hello!"));
    }
    return list;
  }

 
}