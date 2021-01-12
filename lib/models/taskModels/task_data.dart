import 'dart:collection';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:my_draft/models/taskModels/task.dart';
import 'package:my_draft/utils/tastConst.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _activeTasks = [];
  List<Task> _inactiveTasks = [];

  TaskData() {
    getOldTasks();
  }
  // List<int> keys;
  void getOldTasks() {
    log(taskBox.keys.toString());
    for (var key in taskBox.keys) {
      _tasks.add(taskBox.get(key));
    }
    updateTasks();
    log('Done');
    notifyListeners();
  }

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
    updateTasks();
    return _tasks.length;
  }

  int get activeTaskCount {
    updateTasks();
    return _activeTasks.length;
  }

  int get inactiveTaskCount {
    updateTasks();
    return _inactiveTasks.length;
  }

  void updateTasks() {
    _activeTasks = [];
    _inactiveTasks = [];
    for (var e in _tasks) {
      e.isDone ? _inactiveTasks.add(e) : _activeTasks.add(e);
    }
    taskBox.clear();
    taskBox.addAll(_tasks);
    // notifyListeners();
  }

  void addTask(String taskTitle) {
    _tasks.add(Task(title: taskTitle));
    updateTasks();
    log(taskBox.keys.toString());
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

  void deleteAll() {
    _tasks.clear();
    updateTasks();
    taskBox.clear();
    notifyListeners();
  }
}
