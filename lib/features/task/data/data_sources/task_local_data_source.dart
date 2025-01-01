import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> saveTask(TaskModel task);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TaskModel>> getTasks() async {
    final jsonString = sharedPreferences.getString('tasks') ?? '[]';
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((task) => TaskModel.fromJson(task)).toList();
  }

  @override
  Future<void> saveTask(TaskModel task) async {
    final tasks = await getTasks();
    tasks.add(task);
    sharedPreferences.setString(
      'tasks',
      json.encode(tasks.map((task) => task.toJson()).toList()),
    );
  }
}
