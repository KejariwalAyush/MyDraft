import 'package:flutter/material.dart';
import 'package:my_draft/models/taskModels/task.dart';
import 'package:my_draft/models/taskModels/task_data.dart';
import 'package:my_draft/screens/Tasks/taskTile.dart';
import 'package:my_draft/utils/tastConst.dart';
import 'package:provider/provider.dart';

class TaskContainer extends StatelessWidget {
  var tobeShown;
  TaskContainer(this.tobeShown);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.deepPurple[800],
          borderRadius: BorderRadius.circular(25)),
      child: Scrollbar(
        thickness: 5,
        child: ListView.builder(
          itemCount: tobeShown == show.active
              ? Provider.of<TaskData>(context).activeTaskCount
              : tobeShown == show.inactive
                  ? Provider.of<TaskData>(context).inactiveTaskCount
                  : Provider.of<TaskData>(context).taskCount,
          itemBuilder: (context, index) {
            return Consumer<TaskData>(
              builder: (context, taskData, child) {
                Task task = tobeShown == show.active
                    ? taskData.activeTasks[index]
                    : tobeShown == show.inactive
                        ? taskData.inactiveTasks[index]
                        : taskData.tasks[index];
                return TaskTile(
                  task: task,
                  checkboxToggle: () => taskData.updateTaskDone(task),
                  longPressCallback: () => taskData.deleteTask(task),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
