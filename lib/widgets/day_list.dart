import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';
import 'package:tasks_schedule/widgets/day_item.dart';

class DayList extends StatefulWidget {
  const DayList({super.key});

  @override
  State<DayList> createState() => _DayListState();
}

class _DayListState extends State<DayList> {
  final DaysController dayController = DaysController();

  void _selectDate() async {
    showDatePicker(
      helpText: 'Agregar día',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then(
      (date) {
        if (date != null) setState(() => dayController.addDay(Day(date: date)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: _selectDate,
            icon: const Icon(Icons.add),
          ),
          dayController.days.isNotEmpty
              ? Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: 65,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: dayController.days.length,
                      itemBuilder: (context, index) => DayItem(
                        day: dayController.days.elementAt(index),
                      ),
                    ),
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
