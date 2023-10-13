import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/widgets/day_bar.dart';
import 'package:tasks_schedule/widgets/task_list.dart';
import 'package:tasks_schedule/widgets/task_tile.dart';

class DaySection extends StatefulWidget {
  const DaySection({super.key});

  @override
  State<DaySection> createState() => _DaySectionState();
}

class _DaySectionState extends State<DaySection> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        children: [
          DayBar(),
          TaskList(),
        ],
      ),
    );
  }
}
