import 'package:flutter/material.dart';
import '../models/task.dart';

// Stateful widget: its data (the task list) can change
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

// The State class holds the changing data
class _TasksScreenState extends State<TasksScreen> {
  final List<Task> tasks = [
    Task(title: 'Submit lab record'),
    Task(title: 'Prepare for quiz'),
    Task(title: 'Register for Tech Fest'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return CheckboxListTile(
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            value: task.isDone,
            onChanged: (value) {
              // setState tells Flutter: data changed, rebuild the screen
              setState(() {
                task.isDone = value!;
              });
            },
          );
        },
      ),
    );
  }
}