import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:campusconnect/models/task.dart';
import 'package:campusconnect/widgets/task_tile.dart';

void main() {
  testWidgets('TaskTile shows the title and Pending status',
      (WidgetTester tester) async {
    final task = Task(title: 'Submit lab record', category: 'Lab');

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: TaskTile(task: task, onChanged: (_) {})),
    ));

    expect(find.text('Submit lab record'), findsOneWidget);
    expect(find.textContaining('Pending'), findsOneWidget);
  });

  testWidgets('TaskTile shows Completed for a finished task',
      (WidgetTester tester) async {
    final task = Task(title: 'Prepare for quiz', isDone: true);

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: TaskTile(task: task, onChanged: (_) {})),
    ));

    expect(find.textContaining('Completed'), findsOneWidget);
  });

  testWidgets('tapping a TaskTile calls onChanged',
      (WidgetTester tester) async {
    bool called = false;
    final task = Task(title: 'Register for Tech Fest');

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TaskTile(task: task, onChanged: (_) => called = true),
      ),
    ));

    await tester.tap(find.byType(CheckboxListTile));
    await tester.pump();

    expect(called, true);
  });
}