import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/features/task/data/repositories/task_repository_impl.dart';
import 'package:remind_me/features/task/domain/repositories/task_repository.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';
import 'package:remind_me/features/task/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create repository instance
    final TaskRepository taskRepository = TaskRepositoryImpl();

    return MaterialApp(
      home: BlocProvider(
        // Pass repository directly to Bloc
        create: (context) => TaskBloc(taskRepository)..add(const TaskEvent.loadTasks()),
        child: const HomePage(),
      ),
    );
  }
}
