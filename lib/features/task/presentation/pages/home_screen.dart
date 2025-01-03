import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me/config/route/route_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),

            // Heading: My List
            const Text(
              'My List',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // GridView of 5 items with 2 in a row
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 130),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return HomeGadget(index: index);
                },
              ),
            ),

            // Reminder Tile below the GridView
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Icon(Icons.access_alarm, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Reminders Test'),
                  Spacer(),
                  Text('5', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeGadget extends StatelessWidget {
  final int index;
  const HomeGadget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       context.push(Routes.getHomeRoute());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left top icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    _getIcons(index),
                    size: 40,
                    color: Colors.blue,
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '99', // Dynamic count can be added here
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
      
              // Left bottom heading (Today, Scheduled, etc.)
              Text(
                _getHeading(index),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
      
              // Right top large count
            ],
          ),
        ),
      ),
    );
  }

  String _getHeading(int index) {
    switch (index) {
      case 0:
        return 'Today';
      case 1:
        return 'Scheduled';
      case 2:
        return 'All';
      case 3:
        return 'Flagged';
      case 4:
        return 'Completed';
      default:
        return 'Item $index';
    }
  }

  IconData _getIcons(int index) {
    switch (index) {
      case 0:
        return Icons.calendar_month;
      case 1:
        return Icons.schedule_outlined;
      case 2:
        return Icons.list;
      case 3:
        return Icons.flag;
      case 4:
        return Icons.check_circle;
      default:
        return Icons.error;
    }
  }
}
