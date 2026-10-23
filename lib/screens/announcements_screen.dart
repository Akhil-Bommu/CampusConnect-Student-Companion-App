import 'package:flutter/material.dart';
import '../models/announcement.dart';
import '../services/api_service.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  final ApiService _api = ApiService();
  List<Announcement> _announcements = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load(); // fetch as soon as the screen opens
  }

  Future<void> _load() async {
    final data = await _api.fetchAnnouncements();
    if (!mounted) return;
    setState(() {
      _announcements = data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Announcements')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _announcements.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_announcements[index].title));
              },
            ),
    );
  }
}