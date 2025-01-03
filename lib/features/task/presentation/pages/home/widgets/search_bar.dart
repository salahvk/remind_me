import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search...',
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }
}