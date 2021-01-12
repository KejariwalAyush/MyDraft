import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_draft/models/taskModels/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String newText;
    return Container(
      // color: Color(0xff161616),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
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
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              style: TextStyle(color: Colors.white),
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
                color: Theme.of(context).buttonColor,
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
