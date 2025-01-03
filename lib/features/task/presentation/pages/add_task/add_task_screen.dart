import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/theme/color.dart';
import 'package:remind_me/features/task/presentation/pages/add_task/widgets/add_button.dart';
import 'package:remind_me/features/task/presentation/pages/add_task/widgets/date.dart';
import 'package:remind_me/features/task/presentation/pages/add_task/widgets/description.dart';
import 'package:remind_me/features/task/presentation/pages/add_task/widgets/time.dart';
import 'package:remind_me/features/task/presentation/pages/add_task/widgets/title.dart';

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
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// Title Input Field
              AddTaskTitleWidget(titleController: _titleController),

              /// Description Input Field
              AddTaskDescriptionWidget(descController: _descController),

              /// Date & Time Picker
              AddTaskDatePicker(taskBloc: taskBloc),

              /// Date & Time Picker
              AddTaskTimePicker(taskBloc: taskBloc),

              /// Add Task Button
              AddTaskButton(
                  titleController: _titleController,
                  descController: _descController),
            ],
          ),
        ),
      ),
    );
  }
}





