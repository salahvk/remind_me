import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/gadget.dart';

class HomeGridWidget extends StatelessWidget {
  const HomeGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TaskBloc, TaskState>(
        // Fetching task data using BLoC
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 130,
            ),
            itemCount: 5, // Adjust this dynamically based on data
            itemBuilder: (context, index) {
              final tasksInCategory = _getTasksForCategory(state.tasks, index);
              final taskCount = tasksInCategory.length;
              // Here, use actual data from the BLoC state
              return HomeGadget(
                  index: index, taskCount: taskCount, tasks: tasksInCategory);
            },
          );
        },
      ),
    );
  }

  List<Task> _getTasksForCategory(List<Task> tasks, int index) {
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
}
