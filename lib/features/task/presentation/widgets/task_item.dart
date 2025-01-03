import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/core/extension/date_time.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';
import '../../domain/entities/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: RichText(
        text: TextSpan(
          children: [
            const TextSpan(
              text: "Reminders: ", // Static text
              style: TextStyle(
               color: Colors.grey,
     
              ),
            ),
            TextSpan(
              text: "${task.reminderTime.formatTime24()}, ${task.reminderTime.formatDate()}", // Dynamic time
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                 color: Colors.red, // Red color for "Reminders"
              ),
            ),
          ],
        ),
      ),
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
