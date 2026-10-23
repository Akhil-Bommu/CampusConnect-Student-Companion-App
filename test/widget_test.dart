import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:campusconnect/providers/task_provider.dart';
import 'package:campusconnect/screens/add_task_screen.dart';

void main() {
  // Helper: builds the form inside an app with the provider
  Widget buildForm() {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: const MaterialApp(home: AddTaskScreen()),
    );
  }

  testWidgets('shows errors when the form is submitted empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildForm());

    await tester.tap(find.text('Save Task'));
    await tester.pump(); // rebuild after the tap

    expect(find.text('Title is required'), findsOneWidget);
    expect(find.text('Please pick a due date'), findsOneWidget);
  });

  testWidgets('shows an error for a title shorter than 3 characters',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildForm());

    await tester.enterText(find.byType(TextFormField).first, 'ab');
    await tester.pump();

    expect(find.text('Title must be at least 3 characters'), findsOneWidget);
  });
}