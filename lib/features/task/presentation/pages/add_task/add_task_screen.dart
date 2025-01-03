import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/theme/color.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';
import 'package:remind_me/services/date_time_picker_service.dart';

import '../../bloc/task_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        centerTitle: true,
        backgroundColor: RemindMeColors.primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// Title Input Field
              AddTaskTitleWidget(titleController: _titleController),
              const SizedBox(height: 16),

              /// Description Input Field
              AddTaskDescriptionWidget(descController: _descController),
              const SizedBox(height: 16),

              /// Date & Time Picker
              AddTaskDatePicker(taskBloc: taskBloc),
              const SizedBox(height: 16),

              /// Date & Time Picker
              AddTaskTimePicker(taskBloc: taskBloc),
              const SizedBox(height: 24),

              /// Add Task Button
              // AddTaskButton(
              //     titleController: _titleController,
              //     selectedDateTime:,
              //     descController: _descController),
            ],
          ),
        ),
      ),
    );
  }
}

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

class AddTaskDatePicker extends StatelessWidget {
  const AddTaskDatePicker({
    super.key,
    required this.taskBloc,
  });

  final TaskBloc taskBloc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        taskBloc.add(
          const TaskEvent.selectDate(),
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
                state.selectedDate == null
                    ? 'Set Reminder Date'
                    : state.selectedDate ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const Icon(Icons.calendar_today,
                  color: Colors.deepPurple),
            ],
          );
        }),
      ),
    );
  }
}

class AddTaskDescriptionWidget extends StatelessWidget {
  const AddTaskDescriptionWidget({
    super.key,
    required TextEditingController descController,
  }) : _descController = descController;

  final TextEditingController _descController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _descController,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RemindMeColors.primary, width: 2),
        ),
        prefixIcon: const Icon(Icons.description, color: Colors.deepPurple),
      ),
    );
  }
}

class AddTaskTitleWidget extends StatelessWidget {
  const AddTaskTitleWidget({
    super.key,
    required TextEditingController titleController,
  }) : _titleController = titleController;

  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _titleController,
      decoration: InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
        ),
        prefixIcon: const Icon(Icons.title, color: Colors.deepPurple),
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required TextEditingController titleController,
    required DateTime? selectedDateTime,
    required TextEditingController descController,
  })  : _titleController = titleController,
        _selectedDateTime = selectedDateTime,
        _descController = descController;

  final TextEditingController _titleController;
  final DateTime? _selectedDateTime;
  final TextEditingController _descController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () {
          if (_titleController.text.isNotEmpty && _selectedDateTime != null) {
            BlocProvider.of<TaskBloc>(context).add(
              TaskEvent.addTask(Task(
                id: DateTime.now().toString(),
                title: _titleController.text,
                description: _descController.text,
                reminderTime: _selectedDateTime!,
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
  }
}
