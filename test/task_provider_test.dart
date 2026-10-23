import 'package:flutter_test/flutter_test.dart';
import 'package:campusconnect/models/task.dart';
import 'package:campusconnect/providers/task_provider.dart';

void main() {
  group('TaskProvider', () {
    test('starts with 3 pending tasks', () {
      final provider = TaskProvider();
      expect(provider.tasks.length, 3);
      expect(provider.pendingCount, 3);
    });

    test('toggleTask marks a task as done', () {
      final provider = TaskProvider();
      provider.toggleTask(0);
      expect(provider.tasks[0].isDone, true);
      expect(provider.pendingCount, 2);
    });

    test('addTask adds a new task', () {
      final provider = TaskProvider();
      provider.addTask(Task(title: 'Read Flutter docs'));
      expect(provider.tasks.length, 4);
      expect(provider.tasks.last.title, 'Read Flutter docs');
    });
  });
}