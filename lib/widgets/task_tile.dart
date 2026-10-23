import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    super.key,
    required this.task,
    required this.onChanged,
  });

  String get _subtitle {
    final status = task.isDone ? 'Completed' : 'Pending';
    final due = task.dueDate == null
        ? ''
        : ' • Due ${task.dueDate!.day}/${task.dueDate!.month}/${task.dueDate!.year}';
    return '$status • ${task.category}$due';
  }

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
        subtitle: Text(_subtitle),
        value: task.isDone,
        onChanged: onChanged,
      ),
    );
  }
}