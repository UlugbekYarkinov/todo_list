import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modals/tasks.dart';

import '../modals/task.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  late String newTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              TextField(
                autofocus: true,
                onChanged: (value) {
                  newTask = value;
                },
              ),
              MaterialButton(
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
                onPressed: () {
                  if(newTask.isNotEmpty) {
                    Provider.of<Tasks>(context, listen: false).addTask(newTask);
                  }
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
