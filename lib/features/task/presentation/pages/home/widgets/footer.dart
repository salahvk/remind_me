import 'package:flutter/material.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
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
    );
  }
}