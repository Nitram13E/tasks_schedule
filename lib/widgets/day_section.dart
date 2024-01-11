import 'package:flutter/material.dart';
import 'package:tasks_schedule/widgets/action_bar.dart';
import 'package:tasks_schedule/widgets/day_bar.dart';
import 'package:tasks_schedule/widgets/task_list.dart';

class DaySection extends StatefulWidget {
  const DaySection({super.key});

  @override
  State<DaySection> createState() => _DaySectionState();
}

class _DaySectionState extends State<DaySection> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ActionBar(),
        DayBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TaskList(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
