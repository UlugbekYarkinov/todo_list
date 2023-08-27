import 'package:flutter/widgets.dart';
import 'task.dart';

class Tasks extends ChangeNotifier{
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy water'),
  ];

  int get taskCount => tasks.length;
}