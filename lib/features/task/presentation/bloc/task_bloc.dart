import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/core/extension/string_date_time.dart';
import 'package:remind_me/features/task/domain/repositories/task_repository.dart';
import 'package:remind_me/services/date_time_picker_service.dart';
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
  String? selectedDate;
  String? selectedTime;
  TaskBloc(this.taskRepository) : super(const TaskState()) {
    on<_AddTaskEvent>(_onAddTask);
    on<_MarkTaskCompletedEvent>(_onMarkTaskCompleted);
    on<_SelectDateEvent>(_onSelectDateTime);
    on<_SelectTimeEvent>(_onSelectDateTime);
    on<_LoadTasksEvent>(_onLoadTasks);
    on<_ShowErrorEvent>(_onShowError);
  }

  void _onAddTask(_AddTaskEvent event, Emitter<TaskState> emit) {
    final updatedTasks = [...state.tasks, event.task];
    emit(state.copyWith(tasks: updatedTasks));
  }

  void _onMarkTaskCompleted(
      _MarkTaskCompletedEvent event, Emitter<TaskState> emit) {
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

  void _onSelectDateTime(event, Emitter<TaskState> emit) async {
    // Check whether the event is for date or time selection
    if (event is _SelectDateEvent) {
      selectedDate = await DateTimePickerService().showDatePicker();
      emit(state.copyWith(selectedDate: selectedDate));
    } else if (event is _SelectTimeEvent) {
      selectedTime = await DateTimePickerService().showTimePicker();
      emit(state.copyWith(selectedTime: selectedTime));
    }

    if (selectedDate != null && selectedTime != null) {
      emit(state.copyWith(
          selectedDateTime: selectedDate?.toDateTime(selectedTime ?? "")));
    }
  }

  Future<void> _onLoadTasks(
      _LoadTasksEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false));
  }

  void _onShowError(_ShowErrorEvent event, Emitter<TaskState> emit) {
    emit(state.copyWith(errorMessage: event.message));
  }
}
