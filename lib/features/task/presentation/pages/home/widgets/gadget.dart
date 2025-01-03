import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me/config/route/route_constants.dart';
import 'package:remind_me/core/enums/grid.dart';
import 'package:remind_me/features/task/domain/entities/task.dart';

class HomeGadget extends StatelessWidget {
  final int index;
  final int taskCount;

  const HomeGadget(
      {super.key,
      required this.index,
      required this.taskCount,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.getTaskRoute(),
            extra: {'title': _getHeading(index), 'categoryIndex': index});
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
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      taskCount.toString(), // Dynamic count can be added here
                      style: const TextStyle(
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              // Right top large count
            ],
          ),
        ),
      ),
    );
  }

  String _getHeading(int index) {
    // Map the index to the TaskStatus enum
    TaskStatus status = TaskStatus.values[index];
    return status.name; // Access the name through the extension getter
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
