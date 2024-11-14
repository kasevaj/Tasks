
import 'package:flutter/material.dart';
import 'package:tasks/models/global.dart';

class IntrayLog extends StatelessWidget {
  final String title;
  final String keyValue;
  IntrayLog({ required this.keyValue, required this.title});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(keyValue),
      title: Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      height: 90,
      decoration: BoxDecoration(
        color: greenColor, 
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 9.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Radio<int>(
          value: 1, // The value for this specific Radio button
          groupValue: 1, // The currently selected value
          onChanged: (int? value) {
            
          },
        ),
          Column(
            children: <Widget>[
              Text(title),

          ],)
      ],),
    )
    );
  }
}
