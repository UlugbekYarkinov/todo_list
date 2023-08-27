import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modals/tasks.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: tasks.tasks[index].isDone,
              taskTitle: tasks.tasks[index].name,
              checkboxCallback: (checkboxState) {
                // setState(() {
                //   // Provider.of<Tasks>(context).tasks[index].toggleDone();
                // });
              },
            );
          },
          itemCount: tasks.taskCount,
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
  });

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
