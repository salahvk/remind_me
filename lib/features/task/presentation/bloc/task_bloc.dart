import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/features/task/domain/repositories/task_repository.dart';
import '../../domain/entities/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/task.dart';

part 'task_bloc.freezed.dart';
part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  TaskBloc(this.taskRepository) : super(const TaskState()) {
    on<_AddTaskEvent>(_onAddTask);
    on<_MarkTaskCompletedEvent>(_onMarkTaskCompleted);
    on<_LoadTasksEvent>(_onLoadTasks);
    on<_ShowErrorEvent>(_onShowError);
  }

  void _onAddTask(_AddTaskEvent event, Emitter<TaskState> emit) {
    final updatedTasks = [...state.tasks, event.task];
    emit(state.copyWith(tasks: updatedTasks));
  }

  void _onMarkTaskCompleted(_MarkTaskCompletedEvent event, Emitter<TaskState> emit) {
    final updatedTasks = state.tasks.map((task) {
      if (task.id == event.taskId) {
        return Task(
          id: task.id,
          title: task.title,
          description: task.description,
          reminderTime: task.reminderTime,
          isCompleted: true,
        );
      }
      return task;
    }).toList();

    emit(state.copyWith(tasks: updatedTasks));
  }

  Future<void> _onLoadTasks(_LoadTasksEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false));
  }

  void _onShowError(_ShowErrorEvent event, Emitter<TaskState> emit) {
    emit(state.copyWith(errorMessage: event.message));
  }
}
