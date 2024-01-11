import 'package:flutter/material.dart';
import 'package:tasks_schedule/utilities/file_controller.dart';

class FileButtons extends StatefulWidget {
  const FileButtons({super.key});

  @override
  State<FileButtons> createState() => _FileButtonsState();
}

class _FileButtonsState extends State<FileButtons> {
  FileController fileController = FileController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Tooltip(
          message: 'Open file',
          child: IconButton(
            onPressed: fileController.loadFile,
            icon: const Icon(Icons.folder),
          ),
        ),
        Tooltip(
          message: 'Save file',
          child: IconButton(
            onPressed: fileController.writeFile,
            icon: const Icon(Icons.save),
          ),
        ),
      ],
    );
  }
}
