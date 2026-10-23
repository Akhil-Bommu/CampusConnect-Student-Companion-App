import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Exp 5b: Home reads the shared data from TaskProvider
    final pending = context.watch<TaskProvider>().pendingCount;

    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Exp 2a: basic widgets ----------
            const Text(
              'Welcome, Akhil!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
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
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo),
              ),
              child: Text('You have $pending pending task(s).'),
            ),
            const SizedBox(height: 12),
            const Icon(Icons.event, size: 40, color: Colors.indigo),
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
                  borderRadius: BorderRadius.circular(12),
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
            Icon(icon, size: 32, color: Colors.indigo),
            const SizedBox(height: 4),
            Text(label),
          ],
        ),
      ),
    );
  }
}