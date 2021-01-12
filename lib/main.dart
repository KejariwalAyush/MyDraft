import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_draft/models/taskModels/task.dart';
import 'package:my_draft/screens/Tasks/taskHome.dart';
import 'package:my_draft/utils/tastConst.dart';
import 'package:provider/provider.dart';

import 'models/taskModels/task_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(taskBoxName);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'MyDraft',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          buttonColor: Colors.deepPurple[400],
          backgroundColor: Colors.deepPurpleAccent,
          textTheme: GoogleFonts.nunitoTextTheme(),
          brightness: Brightness.dark,
        ),
        home: TaskHome(),
      ),
    );
  }
}
