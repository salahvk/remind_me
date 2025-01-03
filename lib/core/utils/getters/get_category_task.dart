import 'package:remind_me/features/task/domain/entities/task.dart';

List<Task> getTasksForCategory(List<Task> tasks, int index) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Define categories for tasks
    switch (index) {
      case 0:
        return tasks.where((task) => _isToday(task, today)).toList(); // Today
      case 1:
        return tasks
            .where((task) => _isUpcoming(task, today))
            .toList(); // Upcoming
      case 2:
        return tasks
            .where((task) => _isOverdue(task, today))
            .toList(); // Overdue
      case 3:
        return tasks.where((task) => task.isFlagged).toList(); // Flagged
      case 4:
        return tasks.where((task) => task.isCompleted).toList(); // Completed
      default:
        return [];
    }
  }

  bool _isToday(Task task, DateTime today) {
    final taskDate = DateTime(
        task.reminderTime.year, task.reminderTime.month, task.reminderTime.day);
    return taskDate == today;
  }

  bool _isUpcoming(Task task, DateTime today) {
    final taskDate = DateTime(
        task.reminderTime.year, task.reminderTime.month, task.reminderTime.day);
    return taskDate.isAfter(today);
  }

  bool _isOverdue(Task task, DateTime today) {
    final taskDate = DateTime(
        task.reminderTime.year, task.reminderTime.month, task.reminderTime.day);
    return taskDate.isBefore(today) && !task.isCompleted;
  }