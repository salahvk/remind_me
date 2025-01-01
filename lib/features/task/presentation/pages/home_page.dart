import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';
import '../bloc/task_bloc.dart';
import '../widgets/task_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        onPressed: () {
          // Replace with your navigation logic
          context.read<TaskBloc>().add( TaskEvent.addTask(
                Task(
                  id: '1',
                  title: 'Sample Task',
                  description: 'Description',
                  reminderTime: DateTime.now(),
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
