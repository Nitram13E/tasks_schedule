import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:tasks_schedule/widgets/task_bar.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  final QuillController _quillController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Taskbar(),
      children: [
        QuillToolbar.basic(controller: _quillController),
        QuillEditor.basic(controller: _quillController, readOnly: false),
      ],
    );
  }
}
