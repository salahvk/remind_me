import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/route/go_router.dart';
import 'package:remind_me/features/task/data/repositories/task_repository_impl.dart';
import 'package:remind_me/features/task/domain/repositories/task_repository.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';

void main() {
  runApp(const RemindMeApp());
}

class RemindMeApp extends StatelessWidget {
  const RemindMeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create repository instance
    final TaskRepository taskRepository = TaskRepositoryImpl();

    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (context) =>
              TaskBloc(taskRepository)..add(const TaskEvent.loadTasks()),
        ),
      ],
      child: MaterialApp.router(
        title: 'Remind Me',
        // theme: lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}