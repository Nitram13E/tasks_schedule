import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks_schedule/models/task.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';
import 'package:tasks_schedule/widgets/clock.dart';

class Taskbar extends StatefulWidget {
  final Task task;

  const Taskbar({super.key, required this.task});

  @override
  State<Taskbar> createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  DaysController daysController = DaysController();
  TextEditingController hourTextEditingController = TextEditingController();
  TextEditingController minuteTextEditingController = TextEditingController();

  TextEditingController nameTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameTextEditingController.text = widget.task.name!;
  }

  void updateTaskTime({required int hours, required int minutes}) {
    widget.task.totalTime = Duration(
      hours: hours,
      minutes: minutes,
    );

    daysController.selectedDay.value?.updateTask(task: widget.task);
  }

  void updateTaskName(String name) {
    widget.task.name = nameTextEditingController.text;

    daysController.selectedDay.value?.updateTask(task: widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
            value: widget.task.loaded,
            onChanged: (value) => setState(() => widget.task.loaded = value),
          ),
          Clock(
            hours: widget.task.totalTime.inHours,
            minutes: widget.task.totalTime.inMinutes % 60, //TODO: Simplificar logica requerida para obtencion de minutos
            updateTaskTime: updateTaskTime,
          ),
          const Text(' - '),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 40,
              minHeight: 20,
              maxWidth: 200,
              minWidth: 50,
            ),
            child: TextField(
              controller: nameTextEditingController,
              onChanged: (name) => updateTaskName(name),
              decoration: const InputDecoration(
                labelText: "Issue",
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
