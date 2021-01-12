import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_draft/models/taskModels/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function checkboxToggle;
  final Function dismissCallback;

  const TaskTile(
      {Key key, this.task, this.checkboxToggle, this.dismissCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _key = new GlobalKey<ScaffoldState>();
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: _key,
      onDismissed: dismissCallback,
      secondaryBackground: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(5),
        child: Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
      ),
      background: Container(
        color: Colors.redAccent,
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
      ),
      child: ListTile(
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
        title: GestureDetector(
          onDoubleTap: () {
            Clipboard.setData(new ClipboardData(text: task.title));
            ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
              content: new Text("Copied to Clipboard"),
            ));
          },
          child: AutoSizeText(
            task.title,
            style: TextStyle(
                color: task.isDone ? Colors.white54 : Colors.white,
                decoration: task.isDone ? TextDecoration.lineThrough : null),
            maxLines: 2,
            minFontSize: 12,
          ),
        ),
      ),
    );
  }
}
