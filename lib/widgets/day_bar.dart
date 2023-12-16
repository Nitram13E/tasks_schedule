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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard(
                      text: 'Total: 8h',
                      margin: 15,
                    ),
                    InfoCard(
                      text: 'Cargado: 7h',
                      margin: 15,
                    ),
                    InfoCard(
                      text: '2/3',
                      margin: 15,
                    ),
                  ],
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
