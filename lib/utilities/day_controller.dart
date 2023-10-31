import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/file_controller.dart';

class DaysController {
  static final DaysController _instance = DaysController._internal();

  DaysController._internal();
  factory DaysController() => _instance;

  final Map<DateTime, Day> _days = <DateTime, Day>{};
  FileController fileController = FileController();
  final ValueNotifier<Day?> selectedDay = ValueNotifier(null);

  List<Day> get days => _days.values.toList();

  void addDay(Day day) {
    _days[day.date] = day;
    selectDay(day);
  }

  void removeDay(Day day) => _days.remove(day.date);

  void selectDay(Day day) => selectedDay.value = day;

  void loadFromFile() async {
    fileController.loadFile();
    String? fileContent = fileController.file?.readAsStringSync();

    if (fileContent != null) jsonDecode(fileContent);
  }

  void saveFile() async {
    Map<String, dynamic> fileJson = <String, dynamic>{};

    _days.forEach(
      (key, value) => fileJson[key.toString()] = value.toJson(),
    );

    fileController.writeJson(fileJson);
  }
}
