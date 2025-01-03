part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.addTask(Task task) = _AddTaskEvent;
  const factory TaskEvent.markTaskCompleted(String taskId) = _MarkTaskCompletedEvent;
  const factory TaskEvent.selectDate() = _SelectDateEvent;
  const factory TaskEvent.selectTime() = _SelectTimeEvent;
  const factory TaskEvent.loadTasks() = _LoadTasksEvent;
  const factory TaskEvent.showError(String message) = _ShowErrorEvent;
}
