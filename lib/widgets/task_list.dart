import 'package:flutter/cupertino.dart';
import 'package:todo_app/widgets/task_title.dart';
import '../models/task.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  const TaskList(this.tasks, {super.key});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: widget.tasks[index].isDone,
          taskTitle: widget.tasks[index].name,
          checkBoxCallback: (checkBoxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
    );
  }
}
