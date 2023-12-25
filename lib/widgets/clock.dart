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
              width: 60,
              child: Center(
                child: Text(
                  widget.hours <= 9 ? widget.hours.toString().padLeft(2, '0') : widget.hours.toString(),
                ),
              ),
            ),
          ),
          const Text(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            ':',
          ),
          Card(
            child: SizedBox(
              height: 50,
              width: 60,
              child: Center(
                child: Text(
                  widget.minutes <= 9 ? widget.minutes.toString().padLeft(2, '0') : widget.minutes.toString(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
