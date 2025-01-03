import 'package:flutter/material.dart';
import 'package:remind_me/core/utils/getters/get_texttheme.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/footer.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/grid.dart';
import 'package:remind_me/features/task/presentation/pages/home/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
