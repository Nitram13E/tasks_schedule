import 'package:flutter/material.dart';

class FileButtons extends StatefulWidget {
  const FileButtons({super.key});

  @override
  State<FileButtons> createState() => _FileButtonsState();
}

class _FileButtonsState extends State<FileButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.folder),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.save),
        ),
      ],
    );
  }
}
