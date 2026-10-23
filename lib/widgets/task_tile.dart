import 'package:flutter/material.dart';
import '../models/task.dart';

// Custom widget: a reusable row for one task
class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: CheckboxListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(task.isDone ? 'Completed' : 'Pending'),
        value: task.isDone,
        onChanged: onChanged,
      ),
    );
  }
}