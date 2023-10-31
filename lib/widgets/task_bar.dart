import 'package:flutter/material.dart';

class Taskbar extends StatefulWidget {
  const Taskbar({super.key});

  @override
  State<Taskbar> createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
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
