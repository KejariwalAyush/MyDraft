import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_draft/models/taskModels/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function checkboxToggle;

  final Function longPressCallback;

  const TaskTile(
      {Key key, this.task, this.checkboxToggle, this.longPressCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      // leading: Checkbox(
      //   value: task.isDone,
      //   onChanged: checkboxToggle,
      // ),
      leading: GestureDetector(
        onTap: checkboxToggle,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: task.isDone
                  ? Icon(
                      Icons.check_circle,
                      size: 20.0,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.check_circle_outline,
                      size: 20.0,
                      color: Colors.deepPurpleAccent,
                    )),
        ),
      ),
      title: AutoSizeText(
        task.title,
        style: TextStyle(
            color: task.isDone ? Colors.white54 : Colors.white,
            decoration: task.isDone ? TextDecoration.lineThrough : null),
        maxLines: 2,
        minFontSize: 12,
      ),
    );
  }
}
