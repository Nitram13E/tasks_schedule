import 'package:flutter/material.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class Clock extends StatefulWidget {
  final int hours;
  final int minutes;
  final Function updateTaskTime;

  const Clock({super.key, required this.hours, required this.minutes, required this.updateTaskTime});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DaysController daysController = DaysController();

  void timePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: widget.hours,
        minute: widget.minutes,
      ),
      initialEntryMode: TimePickerEntryMode.inputOnly,
    );

    if (time != null) {
      widget.updateTaskTime(
        hours: time.hour,
        minutes: time.minute,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: timePicker,
      child: Row(
        children: [
          Card(
            child: SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  widget.hours.toString(),
                ),
              ),
            ),
          ),
          const Text(':'),
          Card(
            child: SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: Text(
                  widget.minutes.toString(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
