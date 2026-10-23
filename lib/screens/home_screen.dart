import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- Exp 2a: basic widgets ----------

            // Text widget
            const Text(
              'Welcome, Akhil!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Image widget
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

            // Container widget
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.indigo),
              ),
              child: const Text('Check today\'s announcements and events.'),
            ),
            const SizedBox(height: 12),

            // Icon widget
            const Icon(Icons.event, size: 40, color: Colors.indigo),
            const SizedBox(height: 24),

            // ---------- Exp 2b: layout widgets ----------

            // Row: places children side by side
            // Column (inside each item): places children top to bottom
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _action(Icons.event, 'Events'),
                _action(Icons.campaign, 'Announcements'),
                _action(Icons.task_alt, 'Tasks'),
              ],
            ),
            const SizedBox(height: 24),

            // Stack: places children on top of each other
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

  Widget _action(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.indigo),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}