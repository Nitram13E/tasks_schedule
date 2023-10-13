import 'package:flutter/material.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class FileButtons extends StatefulWidget {
  const FileButtons({super.key});

  @override
  State<FileButtons> createState() => _FileButtonsState();
}

class _FileButtonsState extends State<FileButtons> {
  DaysController daysController = DaysController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => daysController.loadFromFile(),
          icon: const Icon(Icons.folder),
        ),
        IconButton(
          onPressed: () => daysController.saveFile(),
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }
}
