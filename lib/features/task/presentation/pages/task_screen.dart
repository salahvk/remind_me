import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me/config/route/route_constants.dart';
import 'package:remind_me/services/notification_service.dart';

import '../bloc/task_bloc.dart';
import '../widgets/task_item.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const platform = MethodChannel('com.example.remind_me/task');

    platform.setMethodCallHandler((call) async {
      if (call.method == 'markAsDone') {
        final String taskId = call.arguments;
        // Handle the task ID
        print('Task ID: $taskId marked as fdsfdsdone');
        context.read<TaskBloc>().add(TaskEvent.markTaskCompleted(taskId));
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Taskify')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          if (state.tasks.isEmpty) {
            return const Center(child: Text('No tasks yet!'));
          }

          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              final now = DateTime.now(); // Current date and time
              final today =
                  DateTime(now.year, now.month, now.day); // Today's date
              final taskDate = DateTime(
                task.reminderTime.year,
                task.reminderTime.month,
                task.reminderTime.day,
              ); // Task's date

              // Check if this is the first item or if the header needs to change
              bool showTodayHeader = index == 0 && taskDate == today;
              bool showNotTodayHeader = index == 0 && taskDate != today;

              // Check if the previous task has a different date
              if (index > 0) {
                final prevTask = state.tasks[index - 1];
                final prevTaskDate = DateTime(
                  prevTask.reminderTime.year,
                  prevTask.reminderTime.month,
                  prevTask.reminderTime.day,
                );

                showTodayHeader = taskDate == today && prevTaskDate != today;
                showNotTodayHeader = taskDate != today && prevTaskDate == today;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Show "Today" header if required
                  if (showTodayHeader)
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 12, top: 8, bottom: 8),
                      child: Text(
                        "Today",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  // Show "Not Today" header if required
                  if (showNotTodayHeader)
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 12, top: 8, bottom: 8),
                      child: Text(
                        "Upcoming",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  // Task Item
                  TaskItem(task: task),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Replace with your navigation logic

          context.push(Routes.getAddTaskRoute());
        },
        // () {

        // NativeNotificationService.triggerNotification(
        //   "Hi salah ",
        //   "salah is a good boy",

        // );

        // NativeNotificationService.scheduleNotification(
        //   "Hi salah ",
        //   "salah is a good good go boy",
        //   DateTime.now().add(const Duration(seconds: 5)),

        // );

        // },
        child: const Icon(Icons.add),
      ),
    );
  }
}
