import 'package:remind_me/features/task/domain/entities/task.dart';

extension TaskStatusExtensions on Task {
  bool isToday() {
    final now = DateTime.now();
    final taskDate =
        DateTime(reminderTime.year, reminderTime.month, reminderTime.day);
    return taskDate.isAtSameMomentAs(now);
  }

  bool isScheduled() {
    final now = DateTime.now();
    final taskDate =
        DateTime(reminderTime.year, reminderTime.month, reminderTime.day);
    return taskDate.isAfter(now);
  }

  // bool isCompleted() {
  //   return isCompleted; // Assuming the Task model has a boolean `isCompleted`
  // }

  // bool isFlagged() {
  //   return isFlagged; // Assuming the Task model has a boolean `isFlagged`
  // }
}
