import 'package:flutter/material.dart';
import 'package:my_draft/models/task.dart';
import 'package:my_draft/models/task_data.dart';
import 'package:my_draft/screens/Tasks/taskTile.dart';
import 'package:provider/provider.dart';

class TaskContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: Provider.of<TaskData>(context).taskCount,
        itemBuilder: (context, index) {
          return Consumer<TaskData>(
            builder: (context, taskData, child) {
              Task task = taskData.tasks[index];
              return TaskTile(
                task: task,
                checkboxToggle: (value) => taskData.updateTaskDone(task),
                longPressCallback: () => taskData.deleteTask(task),
              );
            },
          );
        },
      ),
    );
  }
}
