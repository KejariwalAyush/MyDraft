import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_draft/screens/Tasks/addTaskScreen.dart';
import 'package:my_draft/screens/Tasks/taskContainer.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String newText;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AutoSizeText(
              'Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
              ),
              wrapWords: true,
              minFontSize: 15,
              // strutStyle: StrutStyle.fromTextStyle(Theme.of(context).textTheme.headline1),
            ),
            Expanded(child: TaskContainer()),
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
