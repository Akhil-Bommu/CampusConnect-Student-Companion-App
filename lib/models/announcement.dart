// Represents one announcement received from the API
class Announcement {
  final int id;
  final String title;
  final String body;

  Announcement({
    required this.id,
    required this.title,
    required this.body,
  });

  // Converts one JSON object into an Announcement
  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}