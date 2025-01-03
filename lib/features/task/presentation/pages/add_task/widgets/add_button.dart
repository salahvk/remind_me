import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/theme/color.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required TextEditingController titleController,
    required TextEditingController descController,
  })  : _titleController = titleController,
        _descController = descController;

  final TextEditingController _titleController;
  final TextEditingController _descController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
      return SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: () {
            if (_titleController.text.isNotEmpty &&
                state.selectedDateTime != null) {
              BlocProvider.of<TaskBloc>(context).add(
                TaskEvent.addTask(Task(
                  id: DateTime.now().toString(),
                  title: _titleController.text,
                  description: _descController.text,
                  reminderTime: state.selectedDateTime ?? DateTime.now(),
                )),
              );
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill all fields and select a date!'),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          icon: const Icon(Icons.add),
          label: const Text(
            'Add Task',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: RemindMeColors.primary,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      );
    });
  }
}
