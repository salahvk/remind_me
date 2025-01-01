import 'package:remind_me/features/task/domain/entities/task.dart';

class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime reminderTime;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.reminderTime,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        reminderTime: DateTime.parse(json['reminderTime']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'reminderTime': reminderTime.toIso8601String(),
      };

  // Convert TaskModel to Task entity
  Task toEntity() {
    return Task(
      id: id,
      title: title,
      description: description,
      reminderTime: reminderTime,
    );
  }
}
