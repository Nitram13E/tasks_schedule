import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasks_schedule/models/task.dart';

class Taskbar extends StatefulWidget {
  final Task task;

  const Taskbar({super.key, required this.task});

  @override
  State<Taskbar> createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  TextEditingController hourTextEditingController = TextEditingController();
  TextEditingController minuteTextEditingController = TextEditingController();

  TextEditingController issueTextEditingController = TextEditingController();

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
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 40,
              minHeight: 20,
              maxWidth: 50,
              minWidth: 50,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: hourTextEditingController,
              onChanged: (hour) => widget.task.totalTime = Duration(
                hours: int.parse(hourTextEditingController.text),
                minutes: (widget.task.totalTime.inMinutes % 60),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              decoration: const InputDecoration(
                labelText: "h",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Text(' : '),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 40,
              minHeight: 20,
              maxWidth: 50,
              minWidth: 50,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: minuteTextEditingController,
              onChanged: (minutes) => widget.task.totalTime = Duration(
                hours: widget.task.totalTime.inHours,
                minutes: int.parse(hourTextEditingController.text),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              decoration: const InputDecoration(
                labelText: "m",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Text(' - '),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 40,
              minHeight: 20,
              maxWidth: 200,
              minWidth: 50,
            ),
            child: const TextField(
              decoration: InputDecoration(
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
