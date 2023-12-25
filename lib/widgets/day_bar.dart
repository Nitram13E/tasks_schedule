import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/models/task.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';
import 'package:tasks_schedule/widgets/info_card.dart';
import 'package:tasks_schedule/widgets/no_data.dart';

class DayBar extends StatefulWidget {
  const DayBar({super.key});

  @override
  State<DayBar> createState() => _DayBarState();
}

class _DayBarState extends State<DayBar> {
  DaysController daysController = DaysController();

  _addTask() {
    Day? selectedDay = daysController.selectedDay.value;
    if (selectedDay != null) daysController.selectedDay.value?.addTask(task: Task(id: selectedDay.tasks.value.length));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: daysController.selectedDay,
      builder: (context, selectedDay, child) => selectedDay != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: selectedDay.tasks,
                  builder: (context, value, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: selectedDay.tasksTime,
                        builder: (context, tasksTime, child) => InfoCard(
                          text: 'Total: ${tasksTime.toStringAsFixed(2)}h',
                          margin: 15,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: selectedDay.loadedTasksTime,
                        builder: (context, loadedTasksTime, child) => InfoCard(
                          text: 'Cargado: ${loadedTasksTime.toStringAsFixed(2)}h',
                          margin: 15,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: selectedDay.loadedTasks,
                        builder: (context, loadedTasks, child) => InfoCard(
                          text: '$loadedTasks/${selectedDay.tasks.value.length}',
                          margin: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _addTask,
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          : const NoData(
              text: 'Presione el botón + para agregar un día',
              icon: Icons.calendar_today,
            ),
    );
  }
}
