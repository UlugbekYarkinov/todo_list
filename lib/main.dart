import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modals/tasks.dart';
import 'package:todo_list/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Tasks>(
      create: (context) => Tasks(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

