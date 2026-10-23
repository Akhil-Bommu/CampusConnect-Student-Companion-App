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
    final scheme = Theme.of(context).colorScheme;

    // Exp 8a: AnimatedContainer animates smoothly whenever
    // its color, border or size changes
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: task.isDone ? scheme.primaryContainer : scheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: task.isDone ? scheme.primary : scheme.outlineVariant,
          width: task.isDone ? 2 : 1,
        ),
      ),
      child: Material(
        type: MaterialType.transparency,
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
      ),
    );
  }
}