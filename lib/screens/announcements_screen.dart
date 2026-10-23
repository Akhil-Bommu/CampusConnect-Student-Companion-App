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
  String? _error; // null means no error

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load({bool showSpinner = true}) async {
    if (showSpinner) {
      setState(() {
        _loading = true;
        _error = null;
      });
    }

    try {
      final data = await _api.fetchAnnouncements();
      if (!mounted) return;
      setState(() {
        _announcements = data;
        _error = null;
        _loading = false;
      });
    } catch (e) {
      // Error handling: show a friendly message instead of crashing
      if (!mounted) return;
      setState(() {
        _error = 'Could not load announcements.\nCheck your internet connection.';
        _loading = false;
      });
    }
  }

  // Makes the first letter uppercase (the API titles are lowercase)
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  Widget _buildBody() {
    // 1. Loading state
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. Error state
    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.wifi_off, size: 48),
            const SizedBox(height: 12),
            Text(_error!, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _load,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    // 3. Success state: show the data as cards
    return RefreshIndicator(
      onRefresh: () => _load(showSpinner: false),
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _announcements.length,
        itemBuilder: (context, index) {
          final a = _announcements[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ExpansionTile(
              leading: CircleAvatar(child: Text('${a.id}')),
              title: Text(
                _capitalize(a.title),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: const Text('Campus announcement'),
              childrenPadding: const EdgeInsets.all(16),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(_capitalize(a.body))],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _load,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}