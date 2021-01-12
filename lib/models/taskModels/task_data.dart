import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:my_draft/models/taskModels/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Add it to notes'),
    Task(title: 'Recursive notes'),
    Task(title: 'Add it to notes'),
    Task(title: 'Recursive notes'),
    Task(title: 'Add it to notes'),
    Task(title: 'Recursive notes'),
    Task(title: 'Add it to notes'),
  ];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskTitle) {
    _tasks.add(Task(title: taskTitle));
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTaskDone(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
