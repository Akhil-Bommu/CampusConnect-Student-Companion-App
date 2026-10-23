import 'package:flutter/material.dart';

// Custom widget: a reusable card for one event
class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String venue;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.venue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // color comes from the app theme (set up in Exp 6b)
            Icon(Icons.event,
                size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text('$date • $venue'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}