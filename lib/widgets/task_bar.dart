import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Taskbar extends StatefulWidget {
  const Taskbar({super.key});

  @override
  State<Taskbar> createState() => _TaskbarState();
}

class _TaskbarState extends State<Taskbar> {
  TextEditingController timeTextEditingController = TextEditingController();
  TextEditingController issueTextEditingController = TextEditingController();

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
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 40,
              minHeight: 20,
              maxWidth: 80,
              minWidth: 50,
            ),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: timeTextEditingController,
              onChanged: (value) {
                if (value.contains(' ')) {
                  //TODO: Definir logica de formato
                  //timeTextEditingController.text = value.replaceRange(RegExp(source), )
                }
              },
              decoration: const InputDecoration(
                labelText: "Time",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Text(' - '),
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
