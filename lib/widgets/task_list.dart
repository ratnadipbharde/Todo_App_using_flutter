import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/task_title.dart';
import '../models/task.dart';
import '../models/task_data.dart';
class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList(this.tasks);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkBoxCallback: (checkboxState) {
            Provider.of<TaskData>(context, listen: false).updateTask(task);
          },
          longPressCallback: () {
            Provider.of<TaskData>(context, listen: false).deleteTask(task);
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}