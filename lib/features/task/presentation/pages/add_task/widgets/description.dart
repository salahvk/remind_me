import 'package:flutter/material.dart';
import 'package:remind_me/config/theme/color.dart';

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
          borderSide:  const BorderSide(color: RemindMeColors.primary, width: 2),
        ),
        prefixIcon: const Icon(Icons.description, color: Colors.deepPurple),
      ),
    );
  }
}