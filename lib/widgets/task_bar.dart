import 'package:flutter/material.dart';

class Taskbar extends StatefulWidget {
  const Taskbar({super.key});

  @override
  State<Taskbar> createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        //showTimePicker
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.timelapse_rounded),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 30,
            minHeight: 30,
            maxWidth: 100,
            minWidth: 50,
          ),
          child: const TextField(),
        ),
      ],
    );
    ;
  }
}
