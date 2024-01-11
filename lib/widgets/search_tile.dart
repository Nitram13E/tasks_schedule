import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';

class SearchTile extends StatefulWidget {
  final Day day;

  const SearchTile({super.key, required this.day});

  @override
  State<SearchTile> createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  final DaysController daysController = DaysController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        formatDate(widget.day.date, [dd, '/', mm, '/', yy]),
      ),
      contentPadding: const EdgeInsets.all(5),
      subtitle: Card(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            widget.day.tasksToString(),
            style: GoogleFonts.firaCode(fontSize: 12),
          ),
        ),
      ),
      onTap: () {
        daysController.selectDay(widget.day);
        Navigator.of(context).pop();
      },
    );
  }
}
