import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/events_screen.dart';
import 'screens/announcements_screen.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(const CampusConnectApp());
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusConnect',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),

      // Exp 4b: named routes (note: no `home:` line, '/' is the home screen)
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/events': (context) => const EventsScreen(),
        '/announcements': (context) => const AnnouncementsScreen(),
        '/tasks': (context) => const TasksScreen(),
      },
    );
  }
}