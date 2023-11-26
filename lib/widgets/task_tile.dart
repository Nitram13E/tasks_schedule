import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:tasks_schedule/models/task.dart';
import 'package:tasks_schedule/widgets/task_bar.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  final QuillController _quillController = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Taskbar(task: widget.task),
      children: [
        QuillToolbar.basic(controller: _quillController),
        QuillEditor.basic(controller: _quillController, readOnly: false),
      ],
    );
  }
}
