import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';
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
      builder: (context, selectedDay, child) {
        if (selectedDay != null && selectedDay.tasks.value.isNotEmpty) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: selectedDay.tasks.value.length,
            itemBuilder: (context, index) => const TaskTile(),
          );
        }
        return const Card(
          child: SizedBox(
            height: 100,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.line_style_rounded),
                  Text('Presione el botón + para agregar una tarea'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
