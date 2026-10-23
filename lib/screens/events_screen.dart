import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  // Exp 3b: breakpoints (screen widths where the layout changes)
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 900;

  static const List<Map<String, String>> events = [
    {'title': 'Tech Fest', 'date': '12 Nov', 'venue': 'Main Auditorium'},
    {'title': 'Guest Lecture', 'date': '15 Nov', 'venue': 'Seminar Hall'},
    {'title': 'Sports Day', 'date': '20 Nov', 'venue': 'College Ground'},
    {'title': 'Hackathon', 'date': '25 Nov', 'venue': 'Lab 3'},
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery gives the full screen (window) size
    final double width = MediaQuery.of(context).size.width;

    // Choose columns using the breakpoints
    final int columns = width >= desktopBreakpoint
        ? 3
        : (width >= tabletBreakpoint ? 2 : 1);

    // Bigger screens get more padding
    final double padding = width >= tabletBreakpoint ? 24 : 16;

    return Scaffold(
      appBar: AppBar(
        title: Text('Events (${width.toInt()} px, $columns column(s))'),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(padding),
        crossAxisCount: columns,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: columns == 1 ? 3.5 : 3,
        children: events.map((e) => _eventCard(e)).toList(),
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