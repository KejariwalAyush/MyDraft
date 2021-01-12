import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_draft/screens/Home.dart';
import 'package:provider/provider.dart';

import 'models/taskModels/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'MyDraft',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          buttonColor: Colors.deepPurple[400],
          backgroundColor: Colors.deepPurpleAccent,
          textTheme: GoogleFonts.nunitoTextTheme(),
          brightness: Brightness.dark,
        ),
        home: Home(),
      ),
    );
  }
}
