import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';
import '../bloc/task_bloc.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Column(
        children: [
          TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'Title')),
          TextField(controller: _descController, decoration: const InputDecoration(labelText: 'Description')),
          ElevatedButton(
            onPressed: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  setState(() {
                    _selectedDateTime = DateTime(
                      pickedDate.year,
                      pickedDate.month,
                      pickedDate.day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );
                  });
                }
              }
            },
            child: const Text('Pick Date & Time'),
          ),
          ElevatedButton(
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
              }
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
