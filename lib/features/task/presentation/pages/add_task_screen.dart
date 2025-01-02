import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/theme/color.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';
import 'package:remind_me/services/date_time_picker_service.dart';

import '../bloc/task_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  DateTime? _selectedDateTime;

  String _date = "Select Date";
  String _time = "Select Time";

  // Function to trigger the Date Picker
  Future<void> _pickDate() async {
    String? date = await DateTimePickerService().showDatePicker();
    if (date != null) {
      setState(() {
        _date = date;
      });
    }
  }

  // Function to trigger the Time Picker
  Future<void> _pickTime() async {
    String? time = await DateTimePickerService().showTimePicker();
    if (time != null) {
      setState(() {
        _time = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  prefixIcon: const Icon(Icons.title, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 16),

              /// Description Input Field
              TextField(
                controller: _descController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  prefixIcon:
                      const Icon(Icons.description, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 16),

              /// Date & Time Picker
              InkWell(
                onTap: () async {
                  _pickDate();
                  // final pickedDate = await showDatePicker(
                  //   context: context,
                  //   initialDate: DateTime.now(),
                  //   firstDate: DateTime(2022),
                  //   lastDate: DateTime(2100),
                  // );

                  // if (pickedDate != null) {
                  //   final pickedTime = await showTimePicker(
                  //     context: context,
                  //     initialTime: TimeOfDay.now(),
                  //   );

                  //   if (pickedTime != null) {
                  //     setState(() {
                  //       _selectedDateTime = DateTime(
                  //         pickedDate.year,
                  //         pickedDate.month,
                  //         pickedDate.day,
                  //         pickedTime.hour,
                  //         pickedTime.minute,
                  //       );
                  //     });
                  //   }
                  // }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: RemindMeColors.primary),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedDateTime == null
                            ? 'Pick Date & Time'
                            : '${_selectedDateTime!.toLocal()}'.split('.')[0],
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Icon(Icons.calendar_today,
                          color: Colors.deepPurple),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              /// Add Task Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_titleController.text.isNotEmpty &&
                        _selectedDateTime != null) {
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
                          content:
                              Text('Please fill all fields and select a date!'),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
