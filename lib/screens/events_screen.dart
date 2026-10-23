import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  static const List<Map<String, String>> events = [
    {'title': 'Tech Fest', 'date': '12 Nov', 'venue': 'Main Auditorium'},
    {'title': 'Guest Lecture', 'date': '15 Nov', 'venue': 'Seminar Hall'},
    {'title': 'Sports Day', 'date': '20 Nov', 'venue': 'College Ground'},
    {'title': 'Hackathon', 'date': '25 Nov', 'venue': 'Lab 3'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Events')),
      // Exp 3a: LayoutBuilder gives the space available to this widget
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Phone: single-column list
            return ListView(
              padding: const EdgeInsets.all(16),
              children: events.map((e) => _eventCard(e)).toList(),
            );
          } else {
            // Wide screen: 2-column grid
            return GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3,
              children: events.map((e) => _eventCard(e)).toList(),
            );
          }
        },
      ),
    );
  }

  Widget _eventCard(Map<String, String> e) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.event, color: Colors.indigo),
        title: Text(e['title']!),
        subtitle: Text('${e['date']} • ${e['venue']}'),
      ),
    );
  }
}