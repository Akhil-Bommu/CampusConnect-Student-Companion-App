import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_tile.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;

    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 80),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
            onChanged: (value) =>
                context.read<TaskProvider>().toggleTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-task'),
        child: const Icon(Icons.add),
      ),
    );
  }
}