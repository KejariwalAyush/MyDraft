import 'package:hive/hive.dart';
import 'package:my_draft/models/taskModels/task.dart';

enum show { active, inactive, all }

const String taskBoxName = 'tasks';

Box<Task> taskBox = Hive.box<Task>(taskBoxName);
