import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/services/notification_service.dart';

import '../bloc/task_bloc.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              return TaskItem(task: task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            //  () {
            //   // Replace with your navigation logic
            //   // context.read<TaskBloc>().add( TaskEvent.addTask(
            //   //       Task(
            //   //         id: '1',
            //   //         title: 'Sample Task',
            //   //         description: 'Description',
            //   //         reminderTime: DateTime.now(),
            //   //       ),
            //   //     ));
            //   // context.push(Routes.getAddTaskRoute());

            // },
            () {
            
          // NativeNotificationService.triggerNotification(
          //   "Hi salah ",
          //   "salah is a good boy",
           
          // );

          NativeNotificationService.scheduleNotification(
            "Hi salah ",
            "salah is a good good go boy",
            DateTime.now().add(const Duration(seconds: 5)),
           
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
