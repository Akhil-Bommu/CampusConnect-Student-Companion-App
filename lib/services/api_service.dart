import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/announcement.dart';

class ApiService {
  static const String _url =
      'https://jsonplaceholder.typicode.com/posts?_limit=10';

  Future<List<Announcement>> fetchAnnouncements() async {
    // 1. Send a GET request to the API
    final response = await http.get(Uri.parse(_url));

    // 2. Status code 200 means success
    if (response.statusCode == 200) {
      // 3. Convert the JSON text into a Dart list
      final List<dynamic> data = jsonDecode(response.body);
      // 4. Convert each item into an Announcement
      return data.map((item) => Announcement.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load (code ${response.statusCode})');
    }
  }
}