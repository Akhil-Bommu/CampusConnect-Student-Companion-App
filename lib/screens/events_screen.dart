import 'package:flutter/material.dart';
import '../widgets/event_card.dart';
import '../widgets/fade_slide_in.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  // Exp 3b: breakpoints
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
    final double width = MediaQuery.of(context).size.width;

    final int columns = width >= desktopBreakpoint
        ? 3
        : (width >= tabletBreakpoint ? 2 : 1);

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
        children: [
          // Exp 8b: each card fades and slides in, one after another
          for (int i = 0; i < events.length; i++)
            FadeSlideIn(
              delay: Duration(milliseconds: 150 * i),
              child: EventCard(
                title: events[i]['title']!,
                date: events[i]['date']!,
                venue: events[i]['venue']!,
              ),
            ),
        ],
      ),
    );
  }
}