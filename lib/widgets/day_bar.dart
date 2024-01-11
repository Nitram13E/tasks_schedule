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

    if (selectedDay != null) {
      int nextId = 0;

      if (selectedDay.tasks.value.keys.isNotEmpty) nextId = selectedDay.tasks.value.keys.last + 1;

      selectedDay.addTask(task: Task(id: nextId));
    }
  }

  _deleteDay() => daysController.removeDay(daysController.selectedDay.value!);

  void showDeleteConfirmation() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Day'),
          content: const Text('Are you sure you want to delete this day?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                _deleteDay();
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
            ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Cancel'),
            ),
          ],
        ),
      );

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
                      Tooltip(
                        message: 'Delete day',
                        child: Card(
                          child: IconButton(
                            onPressed: showDeleteConfirmation,
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      ),
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
                          text: 'Loaded time: ${loadedTasksTime.toStringAsFixed(2)}h',
                          margin: 15,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: selectedDay.loadedTasks,
                        builder: (context, loadedTasks, child) => InfoCard(
                          text: 'Tasks loaded: $loadedTasks/${selectedDay.tasks.value.length}',
                          margin: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Tooltip(
                  message: 'Add task',
                  child: Card(
                    child: IconButton(
                      onPressed: _addTask,
                      icon: const Icon(Icons.add),
                    ),
                  ),
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
