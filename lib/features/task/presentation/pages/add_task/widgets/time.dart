import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/theme/color.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';

class AddTaskTimePicker extends StatelessWidget {
  const AddTaskTimePicker({
    super.key,
    required this.taskBloc,
  });

  final TaskBloc taskBloc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        taskBloc.add(
          const TaskEvent.selectTime(),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: RemindMeColors.primary),
        ),
        child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.selectedTime == null
                    ? 'Set Reminder Time'
                    : state.selectedTime ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.watch_later,
                  color: RemindMeColors.primary),
            ],
          );
        }),
      ),
    );
  }
}
