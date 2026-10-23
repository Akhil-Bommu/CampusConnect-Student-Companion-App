import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Submit lab record'),
    Task(title: 'Prepare for quiz'),
    Task(title: 'Register for Tech Fest'),
  ];

  List<Task> get tasks => _tasks;

  int get pendingCount => _tasks.where((t) => !t.isDone).length;

  void toggleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  // Exp 7: add a new task from the form
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}