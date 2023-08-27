import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/modals/tasks.dart';

import '../modals/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            Task task = tasks.tasks[index];
            return TaskTile(
              isChecked: task.isDone,
              taskTitle: task.name,
              checkboxCallback: (checkboxState) {
                tasks.updateTask(task);
              },
              deleteTask: () {
                if (task.isDone) {
                  tasks.deleteTask(task);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('This task is not done yet...'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('NO'),
                        ),
                        TextButton(
                          onPressed: () {
                            tasks.deleteTask(task);
                            Navigator.pop(context);
                          },
                          child: const Text('YES'),
                        ),
                      ],
                    ),
                  );
                }
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
    required this.deleteTask,
  });

  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final void Function()? deleteTask;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTask,
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
