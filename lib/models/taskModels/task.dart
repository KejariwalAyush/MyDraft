import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String title;
  @HiveField(1)
  bool isDone;

  Task({this.title, this.isDone = false});

  void toggleDone() {
    this.isDone = !this.isDone;
  }
}
