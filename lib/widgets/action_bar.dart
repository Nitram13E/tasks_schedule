import 'package:flutter/material.dart';
import 'package:tasks_schedule/widgets/file_buttons.dart';
import 'package:tasks_schedule/widgets/navigation_buttons.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({super.key});

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavigationButtons(),
          SearchBar(
            constraints: const BoxConstraints(
              maxHeight: 300,
              minHeight: 40,
              maxWidth: 1000,
            ),
            hintText: 'Find',
            backgroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: const MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            onChanged: (value) {},
          ),
          const FileButtons(),
        ],
      ),
    );
  }
}
