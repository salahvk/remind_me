import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  static const String _tasksKey = 'tasks';

  @override
  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getString(_tasksKey);
    if (tasksJson == null) return [];

    final List<dynamic> decodedJson = json.decode(tasksJson);
    return decodedJson.map((e) => Task.fromJson(e)).toList();
  }

  @override
  Future<void> addTask(Task task) async {
    final tasks = await getTasks();
    tasks.add(task);

    await _saveTasks(tasks);
  }

  @override
  Future<void> updateTask(Task updatedTask) async {
    final tasks = await getTasks();
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);

    if (index != -1) {
      tasks[index] = updatedTask;
      await _saveTasks(tasks);
    }
  }

  @override
  Future<void> deleteTask(String taskId) async {
    final tasks = await getTasks();
    final updatedTasks = tasks.where((task) => task.id != taskId).toList();

    await _saveTasks(updatedTasks);
  }

  Future<void> _saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = json.encode(tasks.map((task) => task.toJson()).toList());
    await prefs.setString(_tasksKey, tasksJson);
  }
}
