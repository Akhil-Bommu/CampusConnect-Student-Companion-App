import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/events_screen.dart';
import 'screens/announcements_screen.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const CampusConnectApp(),
    ),
  );
}

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusConnect',
      debugShowCheckedModeBanner: false,

      // Exp 6b: app-wide themes
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,

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