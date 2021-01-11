import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_draft/models/task_data.dart';
import 'package:my_draft/screens/Tasks/addTaskScreen.dart';
import 'package:my_draft/screens/Tasks/taskContainer.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String newText;
    return Scaffold(
      appBar: AppBar(
        title: Text('MyDraft'),
      ),
      body: TaskContainer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isDismissible: true,
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
