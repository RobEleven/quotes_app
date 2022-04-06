import 'package:flutter/material.dart';

import 'package:quotesapp/constants.dart';

class TaskTile extends StatelessWidget {
  final String valueName;

  TaskTile({this.valueName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.indigoAccent.shade100, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Center(
          child: ListTile(
            leading: Icon(Icons.star),
            title: Text(
              "$valueName",
              style: listViewValue,
            ),
          ),
        ),
      ),
    );
  }
}
