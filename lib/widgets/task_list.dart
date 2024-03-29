import 'package:flutter/material.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';
import 'package:tasks_schedule/widgets/no_data.dart';
import 'package:tasks_schedule/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final DaysController daysController = DaysController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: daysController.selectedDay,
      builder: (context, selectedDay, child) => selectedDay != null
          ? ValueListenableBuilder(
              valueListenable: selectedDay.tasks,
              builder: (context, tasks, child) {
                if (tasks.isNotEmpty) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: tasks.keys.length,
                    itemBuilder: (context, index) {
                      int key = tasks.keys.elementAt(index);

                      return TaskTile(task: tasks[key]!);
                    },
                  );
                }
                return const NoData(
                  text: 'Presione el botón + para agregar una tarea',
                  icon: Icons.line_style_rounded,
                );
              },
            )
          : const SizedBox(),
    );
  }
}
