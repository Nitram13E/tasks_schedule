import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/widgets/info_card.dart';

class DayBar extends StatefulWidget {
  const DayBar({super.key});

  @override
  State<DayBar> createState() => _DayBarState();
}

class _DayBarState extends State<DayBar> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InfoCard(
              text: 'Total: 8h',
              margin: 15,
            ),
            InfoCard(
              text: 'Cargado: 7h',
              margin: 15,
            ),
          ],
        ),
        InfoCard(
          text: '2/3',
          margin: 15,
        ),
      ],
    );
  }
}
