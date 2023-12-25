import 'package:flutter/material.dart';
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

  void updateTaskStatus({required bool status}) {
    setState(() => widget.task.loaded = status);

    if (widget.task.loaded) {
      if (widget.task.totalTime.inMinutes > 0) daysController.selectedDay.value!.loadedTasksTime.value += (widget.task.totalTime.inMinutes / 60);

      daysController.selectedDay.value!.loadedTasks.value++;
    } else {
      if (widget.task.totalTime.inMinutes > 0) daysController.selectedDay.value!.loadedTasksTime.value -= (widget.task.totalTime.inMinutes / 60);

      daysController.selectedDay.value!.loadedTasks.value--;
    }
  }

  void updateTaskTime({required int hours, required int minutes}) {
    setState(() {
      //Calculation of task time
      if (widget.task.totalTime.inMinutes > 0) daysController.selectedDay.value!.tasksTime.value -= (widget.task.totalTime.inMinutes / 60);
      daysController.selectedDay.value!.tasksTime.value += ((hours * 60) + minutes) / 60;

      //Calculation in case that the task was already loaded
      if (widget.task.loaded) {
        daysController.selectedDay.value!.loadedTasksTime.value -= (widget.task.totalTime.inMinutes / 60);
        daysController.selectedDay.value!.loadedTasksTime.value += ((hours * 60) + minutes) / 60;
      }

      widget.task.setHours = hours;
      widget.task.setMinutes = minutes;
    });
  }

  void updateTaskName(String name) => widget.task.name = nameTextEditingController.text;

  @override
  Widget build(BuildContext context) {
    nameTextEditingController.text = widget.task.name;

    return Row(
      children: [
        Checkbox(
          value: widget.task.loaded,
          onChanged: (value) => updateTaskStatus(status: value!),
        ),
        Clock(
          hours: widget.task.totalTime.inHours,
          minutes: widget.task.minutes,
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
    );
  }
}
