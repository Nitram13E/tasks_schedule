import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';

class DayItem extends StatelessWidget {
  final Day day;

  const DayItem({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Card(
        child: Text(
          day.date.toString(),
        ),
      ),
    );
  }
}
