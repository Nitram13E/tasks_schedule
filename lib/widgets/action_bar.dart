import 'package:flutter/material.dart';
import 'package:tasks_schedule/widgets/file_buttons.dart';
import 'package:tasks_schedule/widgets/navigation_buttons.dart';
import 'package:tasks_schedule/widgets/search_bar.dart';

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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationButtons(),
          TaskSearchBar(),
          FileButtons(),
        ],
      ),
    );
  }
}
