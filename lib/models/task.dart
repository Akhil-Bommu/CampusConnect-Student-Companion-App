class Task {
  String title;
  String description;
  String category;
  DateTime? dueDate;
  bool isDone;

  Task({
    required this.title,
    this.description = '',
    this.category = 'General',
    this.dueDate,
    this.isDone = false,
  });
}