import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me/config/route/route_constants.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';

import '../bloc/task_bloc.dart';
import '../widgets/task_item.dart';

class TaskScreen extends StatelessWidget {
  final Map args;
  const TaskScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      args['title'] as String,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: args['tasks'].length as int,
                  itemBuilder: (context, index) {
                    final task = args['tasks'][index] as Task;
                    final now = DateTime.now();
                    final today = DateTime(now.year, now.month, now.day);
                    final taskDate = DateTime(
                      task.reminderTime.year,
                      task.reminderTime.month,
                      task.reminderTime.day,
                    );

                    bool showTodayHeader = index == 0 && taskDate == today;
                    bool showNotTodayHeader = index == 0 && taskDate != today;

                    if (index > 0) {
                      final prevTask = state.tasks[index - 1];
                      final prevTaskDate = DateTime(
                        prevTask.reminderTime.year,
                        prevTask.reminderTime.month,
                        prevTask.reminderTime.day,
                      );
                      showTodayHeader =
                          taskDate == today && prevTaskDate != today;
                      showNotTodayHeader =
                          taskDate != today && prevTaskDate == today;
                    }

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        TaskItem(task: task),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.getAddTaskRoute()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
