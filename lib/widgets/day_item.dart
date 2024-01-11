import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class DayItem extends StatelessWidget {
  final Day day;
  final DaysController daysController = DaysController();

  DayItem({super.key, required this.day});

  void selectItem() => daysController.selectDay(day);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: ValueListenableBuilder(
          valueListenable: daysController.selectedDay,
          builder: (context, selectedDay, child) => ListTile(
            selected: day == selectedDay,
            contentPadding: const EdgeInsets.all(8),
            dense: true,
            titleAlignment: ListTileTitleAlignment.center,
            title: Text(
              formatDate(day.date, [dd, '/', mm]),
              textAlign: TextAlign.center,
            ),
            onTap: selectItem,
          ),
        ),
      ),
    );
  }
}
