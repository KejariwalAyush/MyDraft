import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_draft/models/taskModels/task_data.dart';
import 'package:my_draft/screens/Tasks/addTaskScreen.dart';
import 'package:my_draft/screens/Tasks/taskContainer.dart';
import 'package:my_draft/utils/tastConst.dart';
import 'package:provider/provider.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({Key key}) : super(key: key);

  @override
  _TaskHomeState createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  var tobeShown;
  @override
  void initState() {
    tobeShown = show.all;
    print(taskBox.keys.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AutoSizeText(
                    'My Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                    ),
                    wrapWords: true,
                    minFontSize: 15,
                    // strutStyle: StrutStyle.fromTextStyle(Theme.of(context).textTheme.headline1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tobeShown = tobeShown == show.active
                                    ? show.all
                                    : show.active;
                              });
                            },
                            child: AutoSizeText(
                              '${Provider.of<TaskData>(context).activeTaskCount} Tasks left   ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              wrapWords: true,
                              minFontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tobeShown = tobeShown == show.inactive
                                    ? show.all
                                    : show.inactive;
                              });
                            },
                            child: AutoSizeText(
                              '${Provider.of<TaskData>(context).inactiveTaskCount} Tasks done',
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15,
                                  decoration: TextDecoration.lineThrough),
                              wrapWords: true,
                              minFontSize: 12,
                              // strutStyle: StrutStyle.fromTextStyle(Theme.of(context).textTheme.headline1),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline),
                        tooltip: 'Delete all',
                        onPressed: () =>
                            Provider.of<TaskData>(context, listen: false)
                                .deleteAll(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TaskContainer(tobeShown),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isDismissible: true,
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        mini: true,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
