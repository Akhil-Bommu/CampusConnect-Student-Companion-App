import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/announcement.dart';

class ApiService {
  static const String _url = 'https://dummyjson.com/posts?limit=10';

  Future<List<Announcement>> fetchAnnouncements() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      // This API wraps the list inside an object: {"posts": [ ... ]}
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> posts = data['posts'];
      return posts.map((item) => Announcement.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load (code ${response.statusCode})');
    }
  }
}