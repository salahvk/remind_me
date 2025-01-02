part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    @Default([]) List<Task> tasks,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TaskState;
}