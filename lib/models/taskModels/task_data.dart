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
  List<Task> _activeTasks = [];
  List<Task> _inactiveTasks = [];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  UnmodifiableListView get activeTasks {
    updateTasks();
    return UnmodifiableListView(_activeTasks);
  }

  UnmodifiableListView get inactiveTasks {
    updateTasks();
    return UnmodifiableListView(_inactiveTasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  int get activeTaskCount {
    return _activeTasks.length;
  }

  int get inactiveTaskCount {
    return _inactiveTasks.length;
  }

  void updateTasks() {
    _activeTasks = [];
    _inactiveTasks = [];
    for (var e in _tasks) {
      e.isDone ? _inactiveTasks.add(e) : _activeTasks.add(e);
    }
    notifyListeners();
  }

  void addTask(String taskTitle) {
    _tasks.add(Task(title: taskTitle));
    updateTasks();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    updateTasks();
    notifyListeners();
  }

  void updateTaskDone(Task task) {
    task.toggleDone();
    updateTasks();
    notifyListeners();
  }
}
