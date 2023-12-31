import 'package:flutter/material.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class NavigationButtons extends StatefulWidget {
  const NavigationButtons({super.key});

  @override
  State<NavigationButtons> createState() => _NavigationButtonsState();
}

class _NavigationButtonsState extends State<NavigationButtons> {
  DaysController daysController = DaysController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => daysController.days.isNotEmpty ? daysController.goTopreviousDay() : null,
          icon: const Icon(Icons.keyboard_arrow_left_rounded),
        ),
        IconButton(
          onPressed: () => daysController.days.isNotEmpty ? daysController.goToNextDay() : null,
          icon: const Icon(Icons.keyboard_arrow_right_rounded),
        ),
      ],
    );
  }
}
