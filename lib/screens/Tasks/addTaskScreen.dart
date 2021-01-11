import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_draft/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  String newText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff737373),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              onChanged: (value) {
                newText = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton.icon(
                onPressed: () {
                  log(newText);
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newText);
                  Navigator.pop(context);
                },
                color: Theme.of(context).accentColor,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
