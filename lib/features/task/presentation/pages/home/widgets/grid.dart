import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/core/utils/getters/get_category_task.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/gadget.dart';

class HomeGridWidget extends StatelessWidget {
  const HomeGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TaskBloc, TaskState>(
        // Fetching task data using BLoC
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 16.0,
              mainAxisExtent: 130,
            ),
            itemCount: 5, // Adjust this dynamically based on data
            itemBuilder: (context, index) {
              final tasksInCategory = getTasksForCategory(state.tasks, index);
              final taskCount = tasksInCategory.length;
              // Here, use actual data from the BLoC state
              return HomeGadget(
                  index: index, taskCount: taskCount, );
            },
          );
        },
      ),
    );
  }

  
}
