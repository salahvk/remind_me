class Task {
  final String id;
  final String title;
  final String description;
  final DateTime reminderTime;
  final bool isCompleted;
  final bool isFlagged;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.reminderTime,
    this.isCompleted = false,
    this.isFlagged = false,
  });

  // fromJson method for deserialization
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      reminderTime: DateTime.parse(json['reminderTime']),
      isCompleted: json['isCompleted'] ?? false, // Default to false if not present
      isFlagged: json['isFlagged'] ?? false, // Default to false if not present
    );
  }

  // toJson method for serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'reminderTime': reminderTime.toIso8601String(),
      'isCompleted': isCompleted,
      'isFlagged': isFlagged,
    };
  }
}
