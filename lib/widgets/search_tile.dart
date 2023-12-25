import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';

class SearchTile extends StatelessWidget {
  final Day day;

  const SearchTile({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        day.date.toString(),
      ),
    );
  }
}
