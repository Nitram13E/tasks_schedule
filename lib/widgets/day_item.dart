import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class DayItem extends StatelessWidget {
  final Day day;
  final DaysController daysController = DaysController();

  DayItem({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Card(
        child: InkWell(
          onTap: () => daysController.selectDay(day),
          child: Center(
            child: Text(
              formatDate(day.date, [dd, '/', mm]),
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
