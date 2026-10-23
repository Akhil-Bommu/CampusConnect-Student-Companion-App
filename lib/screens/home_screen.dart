import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pending = context.watch<TaskProvider>().pendingCount;

    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect')),
      body: SingleChildScrollView(
        padding: AppStyles.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Exp 2a: basic widgets ----------
            Text('Welcome, Akhil!', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppStyles.radius),
              child: Image.asset(
                'assets/images/campus.jpg',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(AppStyles.radius),
                border: Border.all(color: theme.colorScheme.primary),
              ),
              child: Text(
                'You have $pending pending task(s).',
                style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
              ),
            ),
            const SizedBox(height: 12),
            Icon(Icons.event, size: 40, color: theme.colorScheme.primary),
            const SizedBox(height: 24),

            // ---------- Exp 2b + 4b: layouts and named routes ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _action(context, Icons.event, 'Events', '/events'),
                _action(context, Icons.campaign, 'Announcements',
                    '/announcements'),
                _action(context, Icons.task_alt, 'Tasks', '/tasks'),
              ],
            ),
            const SizedBox(height: 24),

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppStyles.radius),
                  child: Image.asset(
                    'assets/images/campus.jpg',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black54,
                    child: const Text(
                      'Upcoming: Tech Fest',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _action(
      BuildContext context, IconData icon, String label, String routeName) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }
}