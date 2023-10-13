import 'package:flutter/material.dart';
import 'package:tasks_schedule/widgets/task_bar.dart';
import 'package:tasks_schedule/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Taskbar(),
        ListView.builder(
          itemCount: 0,
          itemBuilder: (context, index) => const TaskTile(),
        ),
      ],
    );
  }
}
