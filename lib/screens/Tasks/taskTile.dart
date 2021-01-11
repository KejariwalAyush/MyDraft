import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_draft/models/task.dart';

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
      leading: Checkbox(
        value: task.isDone,
        onChanged: checkboxToggle,
      ),
      title: AutoSizeText(
        task.title,
        maxLines: 2,
        minFontSize: 12,
      ),
    );
  }
}
