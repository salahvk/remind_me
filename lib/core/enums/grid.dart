enum TaskStatus { today, scheduled, all, flagged, completed }

extension TaskStatusExtension on TaskStatus {
  String get name {
    switch (this) {
      case TaskStatus.today:
        return 'Today';
      case TaskStatus.scheduled:
        return 'Scheduled';
      case TaskStatus.all:
        return 'All';
      case TaskStatus.flagged:
        return 'Flagged';
      case TaskStatus.completed:
        return 'Completed';
      default:
        return 'Unknown';
    }
  }
}
