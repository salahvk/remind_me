import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';
import '../../domain/entities/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (_) {
          // Mark task as completed
          context.read<TaskBloc>().add(TaskEvent.markTaskCompleted(task.id));
        },
      ),
    );
  }
}
