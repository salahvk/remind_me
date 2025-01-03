import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/method_channel/channel.dart';
import 'package:remind_me/core/utils/getters/get_texttheme.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/footer.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/grid.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const platform =
        MethodChannel(AndroidChannels.notificationMarkAsDoneChannel);

    platform.setMethodCallHandler((call) async {
      if (call.method == 'markAsDone') {
        final String taskId = call.arguments;
        // Handle the task ID
        debugPrint('Task ID: $taskId marked as done');
        context.read<TaskBloc>().add(TaskEvent.markTaskCompleted(taskId));
      }
    });
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Remind Me',
        style: getTextTheme(context).headlineMedium,
      )),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            // Search Bar
            HomeSearchBar(),

            // Heading: My List
            HomeTitleWidget(),

            // GridView
            HomeGridWidget(),

            // Reminder Tile -> want to complete this
            HomeFooter(),
          ],
        ),
      ),
    );
  }
}

class HomeTitleWidget extends StatelessWidget {
  const HomeTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'My List',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
