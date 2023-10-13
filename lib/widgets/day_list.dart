import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';
import 'package:tasks_schedule/widgets/day_item.dart';

class DayList extends StatefulWidget {
  const DayList({super.key});

  @override
  State<DayList> createState() => _DayListState();
}

class _DayListState extends State<DayList> {
  final DaysController dayController = DaysController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          dayController.days.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: dayController.days.length,
                  itemBuilder: (context, index) => DayItem(
                    day: dayController.days.elementAt(index),
                  ),
                )
              : Card(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.date_range_rounded),
                  ),
                ),
        ],
      ),
    );
  }
}
